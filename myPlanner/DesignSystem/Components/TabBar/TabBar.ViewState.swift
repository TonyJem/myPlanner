extension TabBar {
    
    struct ViewState {
        
        enum TabBarViewType {
            case top
            case bottom
        }
        
        let type: TabBarViewType
        let tabs: [PageTab]
        
    }
    
}
