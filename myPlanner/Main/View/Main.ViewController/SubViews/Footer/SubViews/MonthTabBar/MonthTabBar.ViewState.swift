import Foundation

extension Footer.MonthTabBar {
    
    struct ViewState {
        
        enum TabBarViewType {
            case top
            case bottom
        }
        
        let type: TabBarViewType
        let tabs: [Footer.MonthTab]
        
    }
    
}

