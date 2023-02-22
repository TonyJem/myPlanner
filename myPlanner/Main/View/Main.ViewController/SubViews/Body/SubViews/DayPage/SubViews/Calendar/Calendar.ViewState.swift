import Foundation

extension DayPage.Calendar {
    
// TODO: Move in separate extesion related to calendar section only
    enum SectionType {
        case weekDays
        case monthDays
    }
    
    
    
    struct Section: Hashable {
        
        struct Item: Hashable {
            
            let title: String
            let config: DayPage.Calendar.ViewState.Configuration?
            
        }
        
        let type: SectionType
        let items: [Item]
        
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
