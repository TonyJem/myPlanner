import Foundation

extension Calendar {
  
    enum CollectionViewCell {
        
        struct ViewState {
            
            enum cellType {
                case weekDay
                case date
            }
            
            let text: String
            let type: cellType
            
            init(text: String, type: cellType = .date ) {
                self.text = text
                self.type = type
            }
            
        }
        
    }
    
}
