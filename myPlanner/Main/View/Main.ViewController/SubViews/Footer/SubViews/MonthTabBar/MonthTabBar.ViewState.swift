import Foundation

extension Footer.MonthTabBar {
    
    struct ViewState {
        
        enum TabBarViewPosition {
            case top
            case bottom
        }
        
        let position: TabBarViewPosition
        let tabs: [Footer.MonthTab]
        
    }
    
}

