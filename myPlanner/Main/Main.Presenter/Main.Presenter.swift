import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        weak var view: MainView?
        
        private func handlePageTabAction(type: PageTab.PageTabType) {
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
        page: PageTab.PageTabType,
        action: @escaping ((PageTab.PageTabType) -> Void)
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
        activePage: PageTab.PageTabType,
        action: @escaping ((PageTab.PageTabType) -> Void)
    ) -> Header.View.ViewState
    {
        let pages: [PageTab.PageTabType] = [
            .day,
            .week,
            .month,
            .tasks,
            .notes
        ]
        let tabs = createTabs(pages: pages, activePage: activePage, action: action)
        let tabBarViewState = TabBar.ViewState(type: .top, tabs: tabs)
        return .init(tabBarViewState: tabBarViewState)
    }
    
    private func createTabs(
        pages: [PageTab.PageTabType],
        activePage: PageTab.PageTabType,
        action: @escaping ((PageTab.PageTabType) -> Void)
    ) -> [PageTab]
    {
        var tabs: [PageTab] = []
        pages.forEach {
            let tab = PageTab(type: $0, isActive: $0 == activePage, action: action)
            tabs.append(tab)
        }
        return tabs
    }
    
    private func createBodyViewState(for page: PageTab.PageTabType) -> Body.View.ViewState {
        Body.View.ViewState(activePage: page)
    }
    
    private func createFooterViewState() -> Footer.ViewState {
        
        let pages: [PageTab.PageTabType] = [
            .day,
            .week,
            .month,
            .tasks,
            .notes
        ]
        let tabs = createTabs(pages: pages, activePage: .day, action: { _ in } )
        let tabBarViewState = TabBar.ViewState(type: .top, tabs: tabs)
        return Footer.ViewState(tabBarViewState: tabBarViewState)
    }
    
}
