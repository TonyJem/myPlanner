import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        // MARK: - Properties
        
        private let provider: MainProviderProtocol
        
        weak var view: MainView?
        
        // TODO: Need to fix selectedDate calculation
        // in prints I see it show last day of the month
        // for example for March it shows SelectedDate: 0001-02-28 22:18:44 +0000
        // when I have localy 2023-02-20 Mon 00:08
        private var selectedDate: Date {
            didSet {
                print("🟢 SelectedDate: \(selectedDate)")
            }
        }
        
        private var activePage: Header.PageTab.PageTabType = .day
        
        // TODO: Think if we need this parameter, may is ebought to have just only "selectedDate"
        private var activeMonth: Footer.MonthTab.MonthTabType = .january
        
        // MARK: - Init
        
        init(
            provider: MainProviderProtocol
        ) {
            self.provider = provider
            selectedDate = provider.dateNow()
            activeMonth = provider.monthTab(for: selectedDate)
        }
        
        // MARK: - Private Methods
        
        private func handlePageTabAction(type: Header.PageTab.PageTabType) {
            activePage = type
            updateMainView()
        }
        
        private func handleMonthTabAction(month: Footer.MonthTab.MonthTabType) {
            activeMonth = month
            selectedDate = provider.date(for: month)
            updateMainView()
        }
        
        private func handleTodayButtonAction() {
            selectedDate = provider.dateNow()
            activeMonth = provider.monthTab(for: selectedDate)
            updateMainView()
        }
        
        private func updateMainView() {
            let container = createViewStateContainer()
            view?.render(viewStateContainer: container)
        }
        
    }
    
}


// MARK: - MainPresenter protocol implementation

extension Main.Presenter: MainPresenter {
    
    func viewDidLoad() {
        updateMainView()
    }
    
}

// MARK: - Create ViewStates

extension Main.Presenter {
    
    private func createViewStateContainer() -> Main.ViewStateContainer
    {
        let headerViewState = createHeaderViewState()
        let bodyViewState = createBodyViewState()
        let footerViewState = createFooterViewState()
        
        return .init(
            headerViewState: headerViewState,
            bodyViewState: bodyViewState,
            footerViewState: footerViewState
        )
    }
    
    private func createHeaderViewState() -> Header.ViewState
    {
        let pages: [Header.PageTab.PageTabType] = [
            .day,
            .week,
            .month,
            .tasks,
            .notes
        ]
        let tabs = createPageTabs(pages: pages, activePage: activePage, action: handlePageTabAction)
        let tabBarViewState = Header.PageTabBar.ViewState(type: .top, tabs: tabs)
        
        let headerViewState = Header.ViewState(
            month: provider.monthString(date: selectedDate),
            year: provider.yearString(date: selectedDate),
            tabBarViewState: tabBarViewState
        )
        
        return headerViewState
    }
    
    private func createPageTabs(
        pages: [Header.PageTab.PageTabType],
        activePage: Header.PageTab.PageTabType,
        action: @escaping ((Header.PageTab.PageTabType) -> Void)
    ) -> [Header.PageTab]
    {
        var tabs: [Header.PageTab] = []
        pages.forEach {
            let tab = Header.PageTab(type: $0, isActive: $0 == activePage, action: action)
            tabs.append(tab)
        }
        return tabs
    }
    
    private func createDayPageCalendarViewStateMock() -> DayPage.Calendar.ViewState {
        
        let weekDays: [String] = [
            "Mon",
            "Tue",
            "Wed",
            "Thu",
            "Fri",
            "Sat",
            "Sun"
        ]
        
        // TODO: Make sure we can put same numbers but each should be unic anyway!
        // otherwise we will get crash!
        let monthItems: [DayPage.Calendar.ViewState.monthItem] = [
            DayPage.Calendar.ViewState.monthItem(title: "30", config: .previuos),
            DayPage.Calendar.ViewState.monthItem(title: "31", config: .previuos),
            DayPage.Calendar.ViewState.monthItem(title: "1", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "2", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "3", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "4", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "5", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "6", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "7", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "8", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "9", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "10", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "11", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "12", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "13", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "14", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "15", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "16", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "17", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "18", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "19", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "20", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "21", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "22", config: .today),
            DayPage.Calendar.ViewState.monthItem(title: "23", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "24", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "25", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "26", config: .currentSelected),
            DayPage.Calendar.ViewState.monthItem(title: "27", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "28", config: .current),
            DayPage.Calendar.ViewState.monthItem(title: "44", config: .upcoming),
            DayPage.Calendar.ViewState.monthItem(title: "55", config: .upcoming),
            DayPage.Calendar.ViewState.monthItem(title: "66", config: .upcoming),
            DayPage.Calendar.ViewState.monthItem(title: "77", config: .upcoming),
            DayPage.Calendar.ViewState.monthItem(title: "88", config: .upcoming)
        ]
        
        return DayPage.Calendar.ViewState(weekDays: weekDays, monthItems: monthItems)
    }
    
    private func createBodyViewState() -> Body.ViewState {
        
        let dayPageViewState = DayPage.ViewState(
            calendarState: createDayPageCalendarViewStateMock()
        )
        return Body.ViewState(
            activePage: activePage,
            dayPageViewState: dayPageViewState
        )
    }
    
    private func createFooterViewState() -> Footer.ViewState {
        let months: [Footer.MonthTab.MonthTabType] = [
            .january,
            .february,
            .march,
            .april,
            .may,
            .june,
            .july,
            .august,
            .september,
            .october,
            .november,
            .december
        ]
        let tabs = createMonthTabs(months: months, activeMonth: activeMonth, action: handleMonthTabAction )
        let tabBarViewState = Footer.MonthTabBar.ViewState(type: .bottom, tabs: tabs)
        let footerViewState = Footer.ViewState(
            tabBarViewState: tabBarViewState,
            todayButtonAction: handleTodayButtonAction
        )
        return footerViewState
    }
    
    private func createMonthTabs(
        months: [Footer.MonthTab.MonthTabType],
        activeMonth: Footer.MonthTab.MonthTabType,
        action: @escaping ((Footer.MonthTab.MonthTabType) -> Void)
    ) -> [Footer.MonthTab]
    {
        var tabs: [Footer.MonthTab] = []
        months.forEach {
            let tab = Footer.MonthTab(type: $0, isActive: $0 == activeMonth, action: action)
            tabs.append(tab)
        }
        return tabs
    }
    
}
