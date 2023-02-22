import Foundation

// TODO: Create separate extension of Calendar only for section and move all related stuff here
struct CalendarSection: Hashable {
    
    let type: DayPage.Calendar.SectionType
    let items: [CalendarSectionItem]
    
}

// TODO: Rename and move it inside CalendarSection
struct CalendarSectionItem: Hashable {
    
    let title: String
    let config: DayPage.Calendar.ViewState.Configuration?
    
}

extension DayPage.Calendar {
    
// TODO: Move in separate extesion related to calendar section only
    enum SectionType {
        case weekDays
        case monthDays
    }
    
    struct ViewState {
        
        enum Configuration {
            case previuos
            case current
            case currentSelected
            case today
            case todaySelected
            case upcoming
        }
        
        struct MonthItem: Hashable {
            let title: String
            let config: Configuration
        }
        
        let weekDays: [String]
        let monthItems: [MonthItem]
    }
    
}
