import Foundation

protocol MainProviderProtocol {
    
    func testFuncFromMainProviderProtocol()
    
}

extension Main {
    
    final class Provider: MainProviderProtocol {
        
        private let calendarService: CalendarServiceProtocol
        
        init(calendarService: CalendarServiceProtocol) {
            self.calendarService = calendarService
        }
        
        
        func testFuncFromMainProviderProtocol() {
            calendarService.runTestFunc()
        }
        
    }
    
}
