import Foundation

// TODO: Rename all methods in Provider to start from get
// TODO: Decide which order should go functions
// may be it should be named in ABC order ?
protocol MainProviderProtocol {
    
    func dateNow() -> Date
    
    func getMonthString(date: Date) -> String
    
    func getYearString(date: Date) -> String
    
    func getDate(for monthTab: Footer.MonthTab.MonthTabType) -> Date
    
    func getMonthTab(for date: Date ) -> Footer.MonthTab.MonthTabType
    
    func getItems(for date: Date) -> [DayPage.Calendar.CollectionViewCell.ViewState]
    
    func getPrevoiuseDate(for date: Date) -> Date
    
    func getNextDate(for date: Date) -> Date
    
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
        return calendarService.localDateNow()
    }
    
    func getMonthString(date: Date) -> String {
        return calendarService.monthString(date: date)
    }
    
    func getYearString(date: Date) -> String {
        return calendarService.yearString(date: date)
    }
    
    func getDate(for monthTab: Footer.MonthTab.MonthTabType) -> Date {
        return calendarService.date(for: monthTab)
    }
    
    func getMonthTab(for date: Date) -> Footer.MonthTab.MonthTabType {
        return calendarService.monthTab(for: date)
    }
    
    func getItems(for date: Date) -> [DayPage.Calendar.CollectionViewCell.ViewState] {
        calendarService.getItems(for: date)
    }
    
    func getPrevoiuseDate(for date: Date) -> Date {
        calendarService.prevoiuseDate(for: date)
    }
    
    func getNextDate(for date: Date) -> Date {
        calendarService.nextDate(for: date)
    }
    
}
