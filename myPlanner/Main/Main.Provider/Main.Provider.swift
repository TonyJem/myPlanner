import Foundation

protocol MainProviderProtocol {
    
    func dateNow() -> Date
    
    func monthString(date: Date) -> String
    
    func yearString(date: Date) -> String
    
    func date(for monthTab: Footer.MonthTab.MonthTabType) -> Date
    
    func monthTab(for date: Date ) -> Footer.MonthTab.MonthTabType
    
    func createItems(for date: Date) -> [String]
    
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
    
    func dateNow() -> Date {
        return calendarService.dateNow()
    }
    
    func monthString(date: Date) -> String {
        return calendarService.monthString(date: date)
    }
    
    func yearString(date: Date) -> String {
        return calendarService.yearString(date: date)
    }
    
    func date(for monthTab: Footer.MonthTab.MonthTabType) -> Date {
        return calendarService.date(for: monthTab)
    }
    
    func monthTab(for date: Date) -> Footer.MonthTab.MonthTabType {
        return calendarService.monthTab(for: date)
    }
    
    func createItems(for date: Date) -> [String] {
        calendarService.createItems(for: date)
    }
    
}
