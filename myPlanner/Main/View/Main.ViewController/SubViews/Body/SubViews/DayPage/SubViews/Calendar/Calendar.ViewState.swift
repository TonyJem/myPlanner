import Foundation

struct CalendarSection: Hashable {
    
    let type: DayPage.Calendar.SectionType
    let items: [CalendarItem]
    
}

struct CalendarItem: Hashable {
    
    let title: String
    
}

extension DayPage.Calendar {
    
    enum SectionType {
        case weekDays
        case monthDays
    }
    
    struct ViewState {
        
    }
    
}
