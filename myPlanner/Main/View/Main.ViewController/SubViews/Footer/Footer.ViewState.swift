import Foundation

extension Footer {
    
    struct ViewState {
        
        let tabBarViewState: Footer.MonthTabBar.ViewState
        
        let todayButtonAction: (()-> Void)
        
    }
    
}
