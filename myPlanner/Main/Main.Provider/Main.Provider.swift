import Foundation

protocol MainProviderProtocol {
    
}

extension Main {
    
    final class Provider: MainProviderProtocol {
        
        private let calendarService: CalendarServiceProtocol
        
        init(calendarService: CalendarServiceProtocol) {
            self.calendarService = calendarService
        }
        
    }
    
}
