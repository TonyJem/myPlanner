import Foundation

extension Header.PageTabBar {
    
    struct ViewState {
        
        enum TabBarViewType {
            case top
            case bottom
        }
        
        let type: TabBarViewType
        let tabs: [Header.PageTab]
        
    }
    
}
