//
//  EditJournal.swift
//  journaling
//
//  Created by Dana Alghamdi on 20/04/1446 AH.
//

import SwiftUI

struct JournalView: View {
    @State private var title: String = "Great Day"
    @State private var bodyText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede."
    @State private var isSaved: Bool = false
    @State private var date: String = "02/09/2024" // Example date

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Set background color to black

            VStack(alignment: .leading) {
                // Top bar with Cancel and Save buttons
                HStack {
                    Button(action: {
                        // Add cancel action here (e.g., reset or dismiss)
                    }) {
                        Text("Cancel")
                            .foregroundColor(.purple) // Set text color to purple
                    }
                    Spacer()
                    Button(action: {
                        saveJournalEntry()
                    }) {
                        Text("Save")
                            .foregroundColor(.purple) // Set text color to purple
                    }
                }
                .padding()

                // Title (Bold Text)
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold) // Make the title bold
                    .padding([.leading, .trailing])
                    .foregroundColor(.white) // Change text color to white for better visibility
                
                // Date display (aligned to the left)
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding([.leading, .trailing])
                    .padding(.top, -12) // Adjust top padding to move it up slightly

                // Editable body text
                TextEditor(text: $bodyText)
                    .padding()
                    .background(Color("btnBg").cornerRadius(8)) // Set the background color
                    .foregroundColor(.black) // Change text color to black for better visibility
                    .frame(maxHeight: 700) // Set a maximum height for the TextEditor

                Spacer() // Pushes content to the top
            }
            .padding(.top, 16)
        }
    }

    func saveJournalEntry() {
        // Add save functionality here
        isSaved = true
        print("Journal saved!")
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
