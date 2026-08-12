#include "merge_strategy_sccs.h"

#include "factored_transition_system.h"
#include "merge_selector.h"
#include "merge_tree.h"
#include "merge_tree_factory.h"
#include "transition_system.h"

#include <algorithm>
#include <cassert>
#include <iostream>
#include <unordered_set>

using namespace std;

namespace merge_and_shrink {
MergeStrategySCCs::MergeStrategySCCs(
    const FactoredTransitionSystem &fts,
    const shared_ptr<MergeSelector> &merge_selector,
    vector<vector<int>> &&non_singleton_cg_sccs)
    : MergeStrategy(fts),
      merge_selector(merge_selector),
      non_singleton_cg_sccs(move(non_singleton_cg_sccs)) {
}

MergeStrategySCCs::~MergeStrategySCCs() {
}

pair<int, int> MergeStrategySCCs::get_next() {
    if (current_ts_indices.empty()) {
        last_merge_involved_scc_member = false;
        if (non_singleton_cg_sccs.empty()) {
            current_ts_indices.reserve(fts.get_num_active_entries());
            for (int ts_index : fts) {
                current_ts_indices.push_back(ts_index);
            }
        } else {
            vector<int> &current_scc = non_singleton_cg_sccs.front();
            assert(current_scc.size() > 1);
            current_ts_indices = move(current_scc);
            non_singleton_cg_sccs.erase(non_singleton_cg_sccs.begin());
        }
    } else if (last_merge_involved_scc_member) {
        current_ts_indices.push_back(fts.get_size() - 1);
    }

    unordered_set<int> in_current(current_ts_indices.begin(), current_ts_indices.end());
    unordered_set<int> in_future_sccs;
    for (const auto &scc : non_singleton_cg_sccs) {
        for (int idx : scc) {
            in_future_sccs.insert(idx);
        }
    }

    vector<int> candidate_indices = current_ts_indices;
    for (int ts_index : fts) {
        if (!in_current.count(ts_index) && !in_future_sccs.count(ts_index)) {
            candidate_indices.push_back(ts_index);
        }
    }

    vector<pair<int, int>> merge_candidates;
    merge_candidates.reserve(
        (candidate_indices.size() * (candidate_indices.size() - 1)) / 2);
    assert(candidate_indices.size() > 1);
    for (size_t i = 0; i < candidate_indices.size(); ++i) {
        int ts_index1 = candidate_indices[i];
        assert(fts.is_active(ts_index1));
        for (size_t j = i + 1; j < candidate_indices.size(); ++j) {
            int ts_index2 = candidate_indices[j];
            assert(fts.is_active(ts_index2));
            merge_candidates.emplace_back(ts_index1, ts_index2);
        }
    }

    pair<int, int> next_pair = merge_selector->select_merge_from_candidates(
        fts, move(merge_candidates));

    last_merge_involved_scc_member =
        in_current.count(next_pair.first) || in_current.count(next_pair.second);

    for (vector<int>::iterator it = current_ts_indices.begin();
         it != current_ts_indices.end();) {
        if (*it == next_pair.first || *it == next_pair.second) {
            it = current_ts_indices.erase(it);
        } else {
            ++it;
        }
    }
    return next_pair;
}
}
