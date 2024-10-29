//
//  JournalViewModel.swift
//  journaling
//
//  Created by Dana Alghamdi on 25/04/1446 AH.
//

import Foundation

final class JournalViewModel: ObservableObject {
    @Published var journalEntries: [JournalEntry] = []
    @Published var searchText: String = ""
    @Published var filterOption: FilterOption = .all

    enum FilterOption {
        case all, bookmarked, recent
    }

    var filteredEntries: [JournalEntry] {
        var filtered = journalEntries
        switch filterOption {
        case .all:
            break
        case .bookmarked:
            filtered = filtered.filter { $0.isBookmarked }
        case .recent:
            filtered = filtered.sorted { $0.date > $1.date }
        }
        if !searchText.isEmpty {
            filtered = filtered.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.date.localizedCaseInsensitiveContains(searchText) ||
                $0.content.localizedCaseInsensitiveContains(searchText)
            }
        }
        return filtered
    }

    func toggleBookmark(for entry: JournalEntry) {
        if let index = journalEntries.firstIndex(where: { $0.id == entry.id }) {
            journalEntries[index].isBookmarked.toggle()
        }
    }

    func deleteEntry(_ entry: JournalEntry) {
        if let index = journalEntries.firstIndex(where: { $0.id == entry.id }) {
            journalEntries.remove(at: index)
        }
    }
}
