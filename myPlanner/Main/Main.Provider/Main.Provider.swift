import Foundation

protocol MainProviderProtocol {
    
    func currentDate() -> Date
    
    func monthString(date: Date) -> String
    
    func yearString(date: Date) -> String
    
}

extension Main {
    
    final class Provider {
        
        private let calendarService: CalendarServiceProtocol
        
        init(calendarService: CalendarServiceProtocol) {
            self.calendarService = calendarService
        }
        
    }
    
}

// MARK: - MainProviderProtocol implementation

extension Main.Provider: MainProviderProtocol {
    
    func currentDate() -> Date {
        return calendarService.currentDate()
    }
    
    func monthString(date: Date) -> String {
        return calendarService.monthString(date: date)
    }
    
    func yearString(date: Date) -> String {
        return calendarService.yearString(date: date)
    }
    
}
