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
        view?.render(viewState: createInitialMainViewState())
    }
    
}

extension Main.Presenter: TabBarViewCoordinator {
    
    func onDayTab() {
        print("🟢🟢 onDayTab in Presenter")
        view?.render(viewState: createInitialMainViewState())
    }
    
    func onWeekTab() {
        print("🟢🟢 onWeekTab in Presenter")
        view?.render(viewState: createWeekViewState())
    }
    
    func onMonthTab() {
        print("🟢🟢 onMonthTab in Presenter")
        view?.render(viewState: createMonthViewState())
    }
    
}

// MARK: - Create ViewStates

extension Main.Presenter {
    
    private func createInitialMainViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                coordinator: self,
                tabs: [
                    Tabb(type: .day),
                    Tabb(type: .week),
                    Tabb(type: .month)
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
                    Tabb(type: .day),
                    Tabb(type: .week),
                    Tabb(type: .month)
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
                    Tabb(type: .day),
                    Tabb(type: .week),
                    Tabb(type: .month)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .month))
    
    }
    
}
