import Foundation

protocol CalendarServiceProtocol {
    
    /// Creates a `Date` value initialized to the current date and time
    func dateNow() -> Date
    
    /// Converts `Date` value and returns Month as a `String`
    func monthString(date: Date) -> String
    
    /// Converts `Date` value and returns Year as a `String`
    func yearString(date: Date) -> String
    
    /// Defines date for `monthTab` and returns it as a `Date`
    func date(for monthTab: Footer.MonthTab.MonthTabType) -> Date
    
    /// Defines monthTab type for `date` and returns it as a `MonthTabType`
    func monthTab(for date: Date ) -> Footer.MonthTab.MonthTabType
    
}

extension DayPage.Calendar {
    
    final class Service {
        
    }
    
}

extension DayPage.Calendar.Service: CalendarServiceProtocol {
    
    func dateNow() -> Date {
        let date = Date.now.localDate()
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
    
    func date(for monthTab: Footer.MonthTab.MonthTabType) -> Date {
        var components = DateComponents()
        switch monthTab {
        case .january:
            components.month = 1
        case .february:
            components.month = 2
        case .march:
            components.month = 3
        case .april:
            components.month = 4
        case .may:
            components.month = 5
        case .june:
            components.month = 6
        case .july:
            components.month = 7
        case .august:
            components.month = 8
        case .september:
            components.month = 9
        case .october:
            components.month = 10
        case .november:
            components.month = 11
        case .december:
            components.month = 12
        }
        
        // TODO: need to provide Year correctly
        // for cases when need to show next or previouse year
        // TODO: Find out WHY do I need to set hour and day ? Without it I get always 2 hours offset from local
        // Need to find out how it should be in order Users in all world could use thei local time that they have on their devices
        components.hour = 2
        components.day = 1
        components.year = dateNow().get(.year)
        return Calendar.current.date(from: components) ?? dateNow()
    }
    
    // TODO: Refactor to have only "calendar.component(.month" as
    // descripbtion of Tab type
    func monthTab(for date: Date ) -> Footer.MonthTab.MonthTabType {
        let component = date.get(.month)
        switch component {
        case 1:
            return .january
        case 2:
            return .february
        case 3:
            return .march
        case 4:
            return .april
        case 5:
            return .may
        case 6:
            return .june
        case 7:
            return .july
        case 8:
            return .august
        case 9:
            return .september
        case 10:
            return .october
        case 11:
            return .november
        case 12:
            return .december
        default:
            return .january
        }
    }
    
}
