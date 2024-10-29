//
//  AddJournalEntryView.swift
//  journaling
//
//  Created by Dana Alghamdi on 26/04/1446 AH.
//

import SwiftUI

struct AddJournalEntryView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var content = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("Title", text: $title)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .padding()


                
                Text(dateFormatted(date))
                    .foregroundStyle(Color.pur)
                    .opacity(0.3)
                    .padding(.trailing, 230)
                
                TextField("Type your Journal...", text: $content, axis: .vertical)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .padding()


                Spacer()
            }
            .padding()
            .background(Color.btnBg.ignoresSafeArea())
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                        
                },
                trailing: Button("Save") {
                    saveEntry()
                    dismiss()
                }
            )
        }
        .background(Color.btnBg)
    }

    private func saveEntry() {
        let newEntry = JournalEntry(title: title, date: dateFormatted(date), content: content)
        viewModel.journalEntries.append(newEntry)
    }

    private func dateFormatted(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}
