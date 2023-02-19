import Foundation

protocol MainProviderProtocol {
    
    func provideMonthString(for selectedTab: Footer.MonthTab.MonthTabType) -> String
    
}

extension Main {
    
    final class Provider: MainProviderProtocol {
        
        private let calendarService: CalendarServiceProtocol
        
        init(calendarService: CalendarServiceProtocol) {
            self.calendarService = calendarService
        }
        
        func provideMonthString(for selectedTab: Footer.MonthTab.MonthTabType) -> String {
            return calendarService.getMonthName(for: selectedTab)
        }
        
    }
    
}
