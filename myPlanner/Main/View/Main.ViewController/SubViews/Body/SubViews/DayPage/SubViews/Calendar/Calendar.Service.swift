import Foundation

protocol CalendarServiceProtocol {
    
    func getMonthName(for month: Footer.MonthTab.MonthTabType) -> String
    
    /// Creates a date value initialized to the current date and time
    func currentDate() -> Date
    
}

extension DayPage.Calendar {
    
    final class Service {
        
        func monthString(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "LLLL"
            return dateFormatter.string(from: date)
        }
        
        func yearString(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        }
        
    }
    
}

extension DayPage.Calendar.Service: CalendarServiceProtocol {
    
    func currentDate() -> Date {
        let date = Date().localDate()
        return date
    }
    
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
