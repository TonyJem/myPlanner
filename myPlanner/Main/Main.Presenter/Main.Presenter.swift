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
                    TabButton.ViewState(type: .top, title: "MainTab1", color: .green),
                    TabButton.ViewState(type: .top, title: "MainTab2", color: .blue),
                    TabButton.ViewState(type: .top, title: "MainTab3", color: .magenta)
                ])))
    }
    
}
