import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        // MARK: - Properties
        
        private let provider: MainProviderProtocol
        
        weak var view: MainView?
        
        private var activePage: Header.PageTab.PageTabType = .day
        private var activeMonth: Footer.MonthTab.MonthTabType = .january
        
        
        // MARK: - Init
        
        init(provider: MainProviderProtocol) {
            self.provider = provider
        }
        
        // MARK: - Private Methods
        
        private func handlePageTabAction(type: Header.PageTab.PageTabType) {
            activePage = type
            let container = createViewStateContainer()
            view?.render(viewStateContainer: container)
        }
        
        private func handleMonthTabAction(month: Footer.MonthTab.MonthTabType) {
            activeMonth = month
            let container = createViewStateContainer()
            view?.render(viewStateContainer: container)
        }
        
    }
    
}


// MARK: - MainPresenter protocol implementation

extension Main.Presenter: MainPresenter {
    
    func viewDidLoad() {
        let container = createViewStateContainer()
        view?.render(viewStateContainer: container)
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
    
    private func createHeaderViewState() -> Header.View.ViewState
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
        return .init(tabBarViewState: tabBarViewState)
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
    
    private func createBodyViewState() -> Body.ViewState {
        let dayPageViewState = DayPage.ViewState(
            calendarState: DayPage.Calendar.ViewState(
                testText: "\(activeMonth.tabTitle)"
            )
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
        return Footer.ViewState(tabBarViewState: tabBarViewState)
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
