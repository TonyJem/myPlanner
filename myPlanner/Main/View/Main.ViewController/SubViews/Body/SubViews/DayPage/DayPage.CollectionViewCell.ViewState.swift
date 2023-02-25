import Foundation

extension DayPage.CollectionViewCell {
    
    struct ViewState: Hashable {
        
        // TODO: Add real date late if needed to each page in order later return it
        // and may be use it for hashing below
        //            let date: Date
        //
        //            init(date: Date = Date()) {
        //                self.date = date
        //            }
        
        let calendarState: DayPage.Calendar.ViewState
        
        // TODO: Make CollectionViewCell.ViewState really Hashable
        // Now I do some tricks here, that is fine until we have only single ViewState
        // But later need to think and change what should be combined in hasher.combine(...)
        func hash(into hasher: inout Hasher) {
            hasher.combine(calendarState.sections[0])
        }
        
        static func == (lhs: DayPage.CollectionViewCell.ViewState, rhs: DayPage.CollectionViewCell.ViewState) -> Bool {
            return lhs.calendarState.sections[0] == rhs.calendarState.sections[0]
        }
        
    }
    
}
