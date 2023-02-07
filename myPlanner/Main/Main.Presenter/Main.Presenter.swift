import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        weak var view: MainView?
        
        var handleAction: ((PageTab.PageTabType) -> Void) = { pageType in
            switch pageType {
            case .day:
                return print("handle day")
            case .week:
                return print("handle week")
            case .month:
                return print("handle month")
            case .tasks:
                return print("handle tasks")
            case .notes:
                return print("handle notes")
            }
        }
        
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
    
    private func updateView(with viewState: Main.ViewState) {
        view?.render(viewState: viewState)
    }
    
    private func onDayTab() {
        view?.render(viewState: createDayViewState())
    }
    
    private func onWeekTab() {
        view?.render(viewState: createWeekViewState())
    }
    
    private func onMonthTab() {
        view?.render(viewState: createMonthViewState())
    }
    
    private func onTasksTab() {
        view?.render(viewState: createTasksViewState())
    }
    
    private func onNotesTab() {
        view?.render(viewState: createNotesViewState())
    }
    
}

// MARK: - Create ViewStates

extension Main.Presenter {
    
//    TODO: Make ViewState creation in one function depending on option,
    // May be call it container and devide into 3 parts to Header
    private func createViewStateContainer(
        headerViewstate: Header.View.ViewState,
        bodyViewState: Body.View.ViewState
    ) -> Main.ViewStateContainer
    {
        
        .init(
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
