import Foundation

protocol CalendarServiceProtocol {
    
    func getMonthName(for month: Footer.MonthTab.MonthTabType) -> String
    
}

extension DayPage.Calendar {
    
    final class Service: CalendarServiceProtocol {
        
        func getMonthName(for month: Footer.MonthTab.MonthTabType) -> String {
            switch month {
            case .january:
                return "January"
            case .february:
                return "February"
            case .march:
                return "March"
            case .april:
                return "April"
            case .may:
                return "May"
            case .june:
                return "June"
            case .july:
                return "July"
            case .august:
                return "August"
            case .september:
                return "September"
            case .october:
                return "October"
            case .november:
                return "November"
            case .december:
                return "December"
            }
        }
        
    }
    
}
