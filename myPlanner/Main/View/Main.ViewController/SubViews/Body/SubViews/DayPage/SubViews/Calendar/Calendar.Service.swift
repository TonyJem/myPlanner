import Foundation

protocol CalendarServiceProtocol {
    
    /// Creates a `Date` value initialized to the current date and time
    func currentDate() -> Date
    
    /// Converts `Date` value and returns Month as a `String`
    func monthString(date: Date) -> String
    
    /// Converts `Date` value and returns Year as a `String`
    func yearString(date: Date) -> String
    
}

extension DayPage.Calendar {
    
    final class Service {
        
    }
    
}

extension DayPage.Calendar.Service: CalendarServiceProtocol {
    
    func currentDate() -> Date {
        let date = Date().localDate()
        return date
    }
    
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
