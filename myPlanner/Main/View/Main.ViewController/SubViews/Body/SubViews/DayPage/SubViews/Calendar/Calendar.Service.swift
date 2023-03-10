import Foundation

// TODO: Rename all methods in Servidce to start from get what this func is doing
// TODO: Decide which order should go functions on protocol and in implementation
// may be it should be named in ABC order ?
// TODO: Need to read and learn about `Date` type
// and ivestigate what could be relevant and usefull for us in this app
protocol CalendarServiceProtocol {
    
    /// Creates a `Date` value initialized to the current date and time
    func localDateNow() -> Date
    
    /// Converts `Date` value and returns Month as a `String`
    func monthString(date: Date) -> String
    
    /// Converts `Date` value and returns Year as a `String`
    func yearString(date: Date) -> String
    
    /// Defines date for `monthTab` and returns it as a `Date`
    func date(for monthTab: Footer.MonthTab.MonthTabType) -> Date
    
    /// Defines monthTab type for `date` and returns it as a `MonthTabType`
    func monthTab(for date: Date ) -> Footer.MonthTab.MonthTabType
    
    func getItems(for date: Date) -> [DayPage.Calendar.CollectionViewCell.ViewState]
    
    func prevoiuseDate(for date: Date) -> Date
    
    func nextDate(for date: Date) -> Date
    
}

extension DayPage.Calendar {
    
    final class Service {
        
        let calendar = Calendar.current
        
    }
    
}

extension DayPage.Calendar.Service: CalendarServiceProtocol {
    
    func prevoiuseDate(for date: Date) -> Date {
        return calendar.date(byAdding: .day, value: -1, to: date)!
    }
    
    func nextDate(for date: Date) -> Date {
        return calendar.date(byAdding: .day, value: 1, to: date)!
    }
    
    func localDateNow() -> Date {
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
        
        if components.month == localDateNow().get(.month) {
            components.day = localDateNow().get(.day)
        } else {
            components.day = 1
        }
        
        components.year = localDateNow().get(.year)
        return Calendar.current.date(from: components) ?? localDateNow()
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

// MARK: - Create Calendar Items

// TODO: Refactor getItems logic and make it more clear and readable
extension DayPage.Calendar.Service {
    
    func getItems(for date: Date) -> [DayPage.Calendar.CollectionViewCell.ViewState] {
        
        let selectedDayOfMonth = dayOfMonth(date: date)
        
        let dayNow = dayOfMonth(date: localDateNow())
        
        let daysInCurrentMonth = daysInMonth(date: date)
        
        let firstDayOfMonth = firstOfMonth(date: date)
        // TODO: - Rename it for more clear name
        let startingSpaces = weekDay(date: firstDayOfMonth)
        
        let prevMonth = minusMonth(date: date)
        
        let nextMonth = plusMonth(date: date)
        
        let daysInPreviuoseMonth = daysInMonth(date: prevMonth)
        
        var items: [DayPage.Calendar.CollectionViewCell.ViewState] = []
        
        var count: Int = 1
        
        // TODO: Change maximal count from 35 to 42 autoamatically in order to show all current month correctly
        // Sometimes it should be 35 sometimes even 42
        // Item size should be adapted automaticaly
        while(count <= 35) {
            let item: DayPage.Calendar.CollectionViewCell.ViewState
            
            if count <= startingSpaces {
                let monthDay = daysInPreviuoseMonth - startingSpaces + count
                item = DayPage.Calendar.CollectionViewCell.ViewState(
                    date: provideDate(for: prevMonth.get(.month), day: monthDay),
                    title: "\(monthDay)",
                    config: .previuos
                )
                
            } else if count - startingSpaces > daysInCurrentMonth {
                let monthDay = count - startingSpaces - daysInCurrentMonth
                item = DayPage.Calendar.CollectionViewCell.ViewState(
                    date: provideDate(for: nextMonth.get(.month), day: monthDay),
                    title: "\(monthDay)",
                    config: .upcoming
                )
                
            } else {
                let monthDay = count - startingSpaces
                if monthDay == dayNow && monthDay == selectedDayOfMonth {
                    item = DayPage.Calendar.CollectionViewCell.ViewState(
                        date: provideDate(for: date.get(.month), day: monthDay),
                        title: "\(monthDay)",
                        config: .todaySelected
                    )
                    
                } else if monthDay == selectedDayOfMonth {
                    item = DayPage.Calendar.CollectionViewCell.ViewState(
                        date: provideDate(for: date.get(.month), day: monthDay),
                        title: "\(monthDay)",
                        config: .currentSelected
                    )
                    
                } else if monthDay == dayNow && date.get(.month) == localDateNow().get(.month) {
                    item = DayPage.Calendar.CollectionViewCell.ViewState(
                        date: provideDate(for: date.get(.month), day: monthDay),
                        title: "\(monthDay)",
                        config: .today
                    )
                    
                } else {
                    item = DayPage.Calendar.CollectionViewCell.ViewState(
                        date: provideDate(for: date.get(.month), day: monthDay),
                        title: "\(monthDay)",
                        config: .current
                    )
                }
            }
            
            items.append(item)
            count += 1
        }
        
        return items
    }
    
    private func provideDate(for month: Int, day: Int) -> Date {
        var components = DateComponents()
        components.year = 2023
        components.month = month
        components.day = day
        return Calendar.current.date(from: components) ?? localDateNow()
    }
    
    // TODO: Avoid force unwrapping in all code of project
    private func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    private func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    private func weekDay(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 2
    }
    
    private func plusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    private func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    private func dayOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    private func monthOf(date: Date) -> Int {
        let components = calendar.dateComponents([.month], from: date)
        return components.month!
    }
    
}
