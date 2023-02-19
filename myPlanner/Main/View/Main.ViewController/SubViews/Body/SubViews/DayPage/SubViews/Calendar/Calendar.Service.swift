import Foundation

protocol CalendarServiceProtocol {
    
    func runTestFunc()
    
}

extension DayPage.Calendar {
    
    final class Service: CalendarServiceProtocol {
        
        func runTestFunc() {
            print("🟢 This is runTestFunc!")
        }
        
    }
    
}
