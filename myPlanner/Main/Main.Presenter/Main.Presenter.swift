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

// TODO: Find out if my Presenter needs to have Provider or even Coordintor <- I think TabBarViewCoordinator should be another class
extension Main.Presenter: TabBarViewCoordinator {
    
    func onDayTab() {
        view?.render(viewState: createDayViewState())
    }
    
    func onWeekTab() {
        view?.render(viewState: createWeekViewState())
    }
    
    func onMonthTab() {
        view?.render(viewState: createMonthViewState())
    }
    
    func onTasksTab() {
        view?.render(viewState: createTasksViewState())
    }
    
    func onNotesTab() {
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
                coordinator: self,
                tabs: [
                    PageTab(type: .day, isActive: true),
                    PageTab(type: .week),
                    PageTab(type: .month),
                    PageTab(type: .tasks),
                    PageTab(type: .notes)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .day))
    
    }
    
    private func createWeekViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                coordinator: self,
                tabs: [
                    PageTab(type: .day),
                    PageTab(type: .week, isActive: true),
                    PageTab(type: .month),
                    PageTab(type: .tasks),
                    PageTab(type: .notes)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .week))
    
    }
    
    private func createMonthViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                coordinator: self,
                tabs: [
                    PageTab(type: .day),
                    PageTab(type: .week),
                    PageTab(type: .month, isActive: true),
                    PageTab(type: .tasks),
                    PageTab(type: .notes)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .month))
    
    }
    
    private func createTasksViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                coordinator: self,
                tabs: [
                    PageTab(type: .day),
                    PageTab(type: .week),
                    PageTab(type: .month),
                    PageTab(type: .tasks, isActive: true),
                    PageTab(type: .notes)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .tasks))
    
    }
    
    private func createNotesViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                coordinator: self,
                tabs: [
                    PageTab(type: .day),
                    PageTab(type: .week),
                    PageTab(type: .month),
                    PageTab(type: .tasks),
                    PageTab(type: .notes, isActive: true)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .notes))
    
    }
    
}
