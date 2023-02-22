import Foundation

extension DayPage.Calendar {

    // TODO: - Think if we need to create parent Cell class and iherit from it HeaderCell and TableCell
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
