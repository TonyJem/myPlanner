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
    
}

extension DayPage.Calendar {
    
    struct ViewState {
        
        enum Configuration {
            case previuos
            case current
            case currentSelected
            case today
            case todaySelected
            case upcoming
        }
        
        struct HeaderItem: Hashable {
            let title: String
            let config: Configuration? = nil
        }
        
        struct TableItem: Hashable {
            let title: String
            let config: Configuration?
        }
        
        let headerItems: [HeaderItem]
        let tableItems: [TableItem]
    }
    
}

extension DayPage.Calendar {
    
    struct CollectionViewCell {
        
        enum Configuration {
            case previuos
            case current
            case currentSelected
            case today
            case todaySelected
            case upcoming
        }
        
        struct ViewState: Hashable {
            let title: String
            let config: Configuration?
        }
        
    }
    
}
