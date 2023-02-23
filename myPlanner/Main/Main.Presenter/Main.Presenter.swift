import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        typealias Section = DayPage.Calendar.Section
        
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
        private var activeMonthTab: Footer.MonthTab.MonthTabType = .january
        
        // MARK: - Init
        
        init(
            provider: MainProviderProtocol
        ) {
            self.provider = provider
            selectedDate = provider.dateNow()
            activeMonthTab = provider.getMonthTab(for: selectedDate)
        }
        
        // MARK: - Private Methods
        
        private func handlePageTabAction(type: Header.PageTab.PageTabType) {
            activePage = type
            updateMainView()
        }
        
        private func handleMonthTabAction(month: Footer.MonthTab.MonthTabType) {
            activeMonthTab = month
            selectedDate = provider.getDate(for: month)
            updateMainView()
        }
        
        private func handleTodayButtonAction() {
            selectedDate = provider.dateNow()
            activeMonthTab = provider.getMonthTab(for: selectedDate)
            updateMainView()
        }
        
        private func handleCalendarCellTapAction(date: Date) {
            print("🟢🟢🟢 HandleCalendarCellTapAction in Presenter")
            selectedDate = date
            activeMonthTab = provider.getMonthTab(for: date)
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
            month: provider.getMonthString(date: selectedDate),
            year: provider.getYearString(date: selectedDate),
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
    
    // TODO: Make sure we can put same numbers but each should be unic anyway!
    // otherwise we will get crash!
    // Need to insert some validation and check before if it is hasshable
    private func createCalendarViewState() -> DayPage.Calendar.ViewState {
        let headerItems: [DayPage.Calendar.CollectionViewCell.ViewState] = [
            DayPage.Calendar.CollectionViewCell.ViewState(title: "Mon"),
            DayPage.Calendar.CollectionViewCell.ViewState(title: "Tue"),
            DayPage.Calendar.CollectionViewCell.ViewState(title: "Wed"),
            DayPage.Calendar.CollectionViewCell.ViewState(title: "Thu"),
            DayPage.Calendar.CollectionViewCell.ViewState(title: "Fri"),
            DayPage.Calendar.CollectionViewCell.ViewState(title: "Sat"),
            DayPage.Calendar.CollectionViewCell.ViewState(title: "Sun")
        ]
        let tableItems = provider.getItems(for: selectedDate)
        return DayPage.Calendar.ViewState(
            sections: [
                Section(type: .header, items: headerItems),
                Section(type: .table, items: tableItems)
            ],
            itemSelectedAction: handleCalendarCellTapAction
        )
    }
    
    private func createBodyViewState() -> Body.ViewState {
        
        let dayPageViewState = DayPage.ViewState(
            calendarState: createCalendarViewState()
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
        let tabs = createMonthTabs(months: months, activeMonth: activeMonthTab, action: handleMonthTabAction )
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
