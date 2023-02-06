import Foundation

extension Main {
    
    struct ViewState {
        
        let headerViewState: Header.View.ViewState
        
        static let initial: ViewState = ViewState(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabViewStates:[
                    TabButton.ViewState(type: .top, title: "MainTab1", color: .green),
                    TabButton.ViewState(type: .top, title: "MainTab2", color: .blue),
                    TabButton.ViewState(type: .top, title: "MainTab3", color: .magenta)
                ])))
        
        init(headerViewState: Header.View.ViewState) {
            self.headerViewState = headerViewState
        }
        
    }
    
}
