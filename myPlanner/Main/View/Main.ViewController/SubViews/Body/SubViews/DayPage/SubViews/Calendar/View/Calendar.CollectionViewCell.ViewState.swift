import Foundation

extension Calendar {
    
    enum CollectionViewCell {
        
        struct ViewState {
            
            enum CellType {
                case weekDay
                case date
            }
            
            enum MonthType {
                case previousMonth
                case currentMonth
                case nextMonth
            }
            
            let text: String
            let cellType: CellType
            let monthType: MonthType
            let isSelected: Bool
            let isToday: Bool
            
            init(
                text: String,
                cellType: CellType = .date,
                monthType: MonthType = .currentMonth,
                isSelected: Bool = false,
                isToday:Bool = false
            ) {
                self.text = text
                self.cellType = cellType
                self.monthType = monthType
                self.isSelected = isSelected
                self.isToday = isToday
            }
            
        }
        
    }
    
}
