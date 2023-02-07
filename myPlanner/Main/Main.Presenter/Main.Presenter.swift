import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        weak var view: MainView?
        
    }
    
}


// MARK: - MainPresenter protocol implementation

extension Main.Presenter: MainPresenter {
    
    func viewDidLoad() {
        view?.render(viewState: createDayViewState())
    }
    
}

// MARK: - Page Tab Actions

extension Main.Presenter {
    
    func handleAction(type: PageTab.PageTabType) {
        switch type {
        case .day:
            updateView(with: createDayViewState())
        case .week:
            updateView(with: createWeekViewState())
        case .month:
            updateView(with: createMonthViewState())
        case .tasks:
            updateView(with: createTasksViewState())
        case .notes:
            updateView(with: createNotesViewState())
        }
    }
    
    private func updateView(with viewState: Main.ViewState) {
        view?.render(viewState: viewState)
    }
    
}

// MARK: - Create ViewStates

extension Main.Presenter {
    
    //    TODO: Make ViewState creation in one function depending on option,
    // May be call it container and devide into 3 parts to Header
    private func createViewStateContainer(
        type: PageTab.PageTabType,
        headerViewstate: Header.View.ViewState,
        bodyViewState: Body.View.ViewState
    ) -> Main.ViewStateContainer
    {
        
        return .init(
            headerViewState: headerViewstate,
            bodyViewState: bodyViewState
        )
    }
    
    
    private func createDayViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, isActive: true, action: handleAction),
                    PageTab(type: .week, action: handleAction),
                    PageTab(type: .month, action: handleAction),
                    PageTab(type: .tasks, action: handleAction),
                    PageTab(type: .notes, action: handleAction)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .day))
    
    }
    
    private func createWeekViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, action: handleAction),
                    PageTab(type: .week, isActive: true, action: handleAction),
                    PageTab(type: .month, action: handleAction),
                    PageTab(type: .tasks, action: handleAction),
                    PageTab(type: .notes, action: handleAction)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .week))
    
    }
    
    private func createMonthViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, action: handleAction),
                    PageTab(type: .week, action: handleAction),
                    PageTab(type: .month, isActive: true, action: handleAction),
                    PageTab(type: .tasks, action: handleAction),
                    PageTab(type: .notes, action: handleAction)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .month))
    
    }
    
    private func createTasksViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, action: handleAction),
                    PageTab(type: .week, action: handleAction),
                    PageTab(type: .month, action: handleAction),
                    PageTab(type: .tasks, isActive: true, action: handleAction),
                    PageTab(type: .notes, action: handleAction)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .tasks))
    
    }
    
    private func createNotesViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, action: handleAction),
                    PageTab(type: .week, action: handleAction),
                    PageTab(type: .month, action: handleAction),
                    PageTab(type: .tasks, action: handleAction),
                    PageTab(type: .notes, isActive: true, action: handleAction)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .notes))
    
    }
    
}
