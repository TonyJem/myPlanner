import Foundation

extension DayPage.Calendar {
    
    struct Section: Hashable {
        
        enum SectionType {
            case header
            case table
        }
        
        let type: SectionType
        let items: [DayPage.Calendar.CollectionViewCell.ViewState]
        
    }
    
}

extension DayPage.Calendar {
    
    struct ViewState {
        
        let sections: [DayPage.Calendar.Section]
        
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
            
            init(title: String, config: Configuration? = nil) {
                self.title = title
                self.config = config
            }
            
        }
        
    }
    
}
