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
