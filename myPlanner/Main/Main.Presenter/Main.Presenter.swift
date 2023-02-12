import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        weak var view: MainView?
        
        private func handlePageTabAction(type: Header.PageTab.PageTabType) {
            let container = createViewStateContainer(page: type, action: handlePageTabAction)
            view?.render(viewStateContainer: container)
        }
        
    }
    
}


// MARK: - MainPresenter protocol implementation

extension Main.Presenter: MainPresenter {
    
    func viewDidLoad() {
        let viewStateContainer = createViewStateContainer(page: .day, action: handlePageTabAction)
        view?.render(viewStateContainer: viewStateContainer)
    }
    
}

// MARK: - Create ViewStates

extension Main.Presenter {
    
    private func createViewStateContainer(
        page: Header.PageTab.PageTabType,
        action: @escaping ((Header.PageTab.PageTabType) -> Void)
    ) -> Main.ViewStateContainer
    {
        let headerViewState = createHeaderViewState(
            activePage: page,
            action: action
        )
        
        let bodyViewState = createBodyViewState(for: page)
        
        let footerViewState = createFooterViewState()
        
        return .init(
            headerViewState: headerViewState,
            bodyViewState: bodyViewState,
            footerViewState: footerViewState
        )
    }
    
    private func createHeaderViewState(
        activePage: Header.PageTab.PageTabType,
        action: @escaping ((Header.PageTab.PageTabType) -> Void)
    ) -> Header.View.ViewState
    {
        let pages: [Header.PageTab.PageTabType] = [
            .day,
            .week,
            .month,
            .tasks,
            .notes
        ]
        let tabs = createPageTabs(pages: pages, activePage: activePage, action: action)
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
    
    private func createBodyViewState(for page: Header.PageTab.PageTabType) -> Body.View.ViewState {
        Body.View.ViewState(activePage: page)
    }
    
    private func createFooterViewState() -> Footer.ViewState {
        let months: [Footer.MonthTab.MonthTabType] = [
            .january,
            .february,
            .march
        ]
        let tabs = createMonthTabs(months: months, activeMonth: .january, action: { _ in } )
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
