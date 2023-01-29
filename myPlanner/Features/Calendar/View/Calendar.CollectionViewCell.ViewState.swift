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
            let isSelected: Bool
            let isToday: Bool
            
            init(
                text: String,
                type: cellType = .date,
                isSelected: Bool = false,
                isToday:Bool = false
            ) {
                self.text = text
                self.type = type
                self.isSelected = isSelected
                self.isToday = isToday
            }
            
        }
        
    }
    
}
