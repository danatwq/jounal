//
//  MainPage2.swift
//  journaling
//
//  Created by Dana Alghamdi on 26/04/1446 AH.
//

// MainPage2.swift

import SwiftUI

struct MainPage2: View {
    @StateObject private var viewModel = JournalViewModel()
    @State private var showAddEntry = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    header
                    searchField
                    if viewModel.journalEntries.isEmpty {
                        emptyState
                    } else {
                        entryList
                    }
                }
            }
            .accentColor(.white)
        }
    }

    private var header: some View {
        HStack {
            Text("Journal")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Menu {
                Button("All Entries", action: { viewModel.filterOption = .all })
                Button("Bookmark", action: { viewModel.filterOption = .bookmarked })
                Button("Recent", action: { viewModel.filterOption = .recent })
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .foregroundColor(.pur)
                    .font(.system(size: 24))
            }
            
            Button(action: { showAddEntry.toggle() }) {
                Image(systemName: "plus")
                    .foregroundColor(.pur)
                    .font(.system(size: 24))
            }
            .sheet(isPresented: $showAddEntry) {
                AddJournalEntryView(viewModel: viewModel)
            }
        }
        .padding()
    }

    private var searchField: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 370, height: 50)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10.0)
                
                TextField("Search", text: $viewModel.searchText)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.clear)
                
                Button(action: {}) {
                    Image(systemName: "mic")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
            }
            .padding(.horizontal)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 10) {
            Spacer()
            Image("icon")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Begin Your Journal")
                .foregroundColor(.pur)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Craft your personal diary, tap the plus icon to begin")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding(.bottom, 100)
    }

    private var entryList: some View {
        List {
            ForEach(viewModel.filteredEntries) { entry in
                JournalRow(entry: entry) {
                    viewModel.toggleBookmark(for: entry)
                }
                .swipeActions(edge: .leading) {
                    Button {
                        // Edit functionality
                    } label: {
                        Image(systemName: "pencil")
                    }
                    .tint(.edit)
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        viewModel.deleteEntry(entry)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
                .listRowBackground(Color.clear) // Ensure clear background for rows
            }
        }
        .listStyle(PlainListStyle())
    }
}

// JournalRow struct definition
struct JournalRow: View {
    let entry: JournalEntry
    let toggleBookmark: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(entry.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(entry.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(entry.content)
                    .font(.body)
                    .foregroundColor(.white)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            
            Button(action: toggleBookmark) {
                Image(systemName: entry.isBookmarked ? "bookmark.fill" : "bookmark")
                    .foregroundColor(entry.isBookmarked ? .yellow : .gray)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2)) // Background color for the row
        .cornerRadius(8) // Rounded corners
    }
}

#Preview {
    MainPage2()
}
