import Foundation

protocol MainProviderProtocol {
    
    func provideMonthString(for selectedTab: Footer.MonthTab.MonthTabType) -> String
    
    func getCurrentDate() -> Date
    
}

extension Main {
    
    final class Provider: MainProviderProtocol {

        
        
        private let calendarService: CalendarServiceProtocol
        
        init(calendarService: CalendarServiceProtocol) {
            self.calendarService = calendarService
        }
        
        // MARK: - MainProviderProtocol implementation
        
        func provideMonthString(for selectedTab: Footer.MonthTab.MonthTabType) -> String {
            return calendarService.getMonthName(for: selectedTab)
        }
        
        func getCurrentDate() -> Date {
            return calendarService.currentDate()
        }
        
    }
    
}
