import Foundation

extension DayPage.Calendar {
    
    struct Section: Hashable {
        
        enum SectionType {
            case header
            case table
        }
        
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
