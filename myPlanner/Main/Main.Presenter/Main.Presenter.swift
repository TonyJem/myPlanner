import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        weak var view: MainView?
        
        var presenterClosure: (() -> Void) = { }
        
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
    private func createDayViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, isActive: true, action: onDayTab),
                    PageTab(type: .week, action: onWeekTab),
                    PageTab(type: .month, action: onMonthTab),
                    PageTab(type: .tasks, action: onTasksTab),
                    PageTab(type: .notes, action: onNotesTab)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .day))
    
    }
    
    private func createWeekViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, action: onDayTab),
                    PageTab(type: .week, isActive: true, action: onWeekTab),
                    PageTab(type: .month, action: onMonthTab),
                    PageTab(type: .tasks, action: onTasksTab),
                    PageTab(type: .notes, action: onNotesTab)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .week))
    
    }
    
    private func createMonthViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, action: onDayTab),
                    PageTab(type: .week, action: onWeekTab),
                    PageTab(type: .month, isActive: true, action: onMonthTab),
                    PageTab(type: .tasks, action: onTasksTab),
                    PageTab(type: .notes, action: onNotesTab)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .month))
    
    }
    
    private func createTasksViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, action: onDayTab),
                    PageTab(type: .week, action: onWeekTab),
                    PageTab(type: .month, action: onMonthTab),
                    PageTab(type: .tasks, isActive: true, action: onTasksTab),
                    PageTab(type: .notes, action: onNotesTab)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .tasks))
    
    }
    
    private func createNotesViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    PageTab(type: .day, action: onDayTab),
                    PageTab(type: .week, action: onWeekTab),
                    PageTab(type: .month, action: onMonthTab),
                    PageTab(type: .tasks, action: onTasksTab),
                    PageTab(type: .notes, isActive: true, action: onNotesTab)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .notes))
    
    }
    
}
