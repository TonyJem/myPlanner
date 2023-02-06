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
        view?.render(viewState: createInitialMainViewState())
    }
    
}

// MARK:
extension Main.Presenter {
    
    private func createInitialMainViewState() -> Main.ViewState {
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabViewStates:[
                    TabButton.ViewState(type: .top, title: "Day", color: .tabDayBackround),
                    TabButton.ViewState(type: .top, title: "Week", color: .tabWeekBackround),
                    TabButton.ViewState(type: .top, title: "Month", color: .tabMonthBackround),
                    TabButton.ViewState(type: .top, title: "Tasks", color: .tabTasksBackround),
                    TabButton.ViewState(type: .top, title: "Notes", color: .tabNotesBackround)
                ])))
    }
    
}
