


import Foundation


struct JournalEntry: Identifiable {
    let id = UUID()
    var title: String
    var date: String
    var content: String
    var isBookmarked: Bool = false
}
