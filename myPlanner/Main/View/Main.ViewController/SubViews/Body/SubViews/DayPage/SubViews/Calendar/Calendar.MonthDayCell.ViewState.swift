import Foundation

extension DayPage.Calendar.MonthDayCell {
    
    struct ViewState: Hashable {
        
        enum Configuration {
            case previuos
            case current
            case currentSelected
            case today
            case todaySelected
            case upcoming
        }
        
        let title: String
        let config: Configuration
        
    }
    
}
