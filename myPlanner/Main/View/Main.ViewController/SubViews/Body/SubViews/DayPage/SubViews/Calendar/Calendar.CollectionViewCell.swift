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
            
            let date: Date
            let title: String
            let config: Configuration?
            
            init(date: Date = Date(), title: String, config: Configuration? = nil) {
                self.date = date
                self.title = title
                self.config = config
            }
            
        }
        
    }
    
}
