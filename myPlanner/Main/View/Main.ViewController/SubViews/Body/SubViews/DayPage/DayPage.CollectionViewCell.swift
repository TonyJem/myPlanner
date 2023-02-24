import Foundation

extension DayPage {
    
    struct CollectionViewCell {
        
        struct ViewState: Hashable {
            
            let date: Date
            
            init(date: Date = Date()) {
                self.date = date
            }
            
        }
        
    }
    
}
