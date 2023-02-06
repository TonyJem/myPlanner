import UIKit


final class TabBarView: UIStackView {
    
    /// Holds the ViewState of the `TabBarView` and renders it when set.
    var viewState: ViewState? {
        didSet {
            render(viewState: viewState)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        axis  = NSLayoutConstraint.Axis.horizontal
//        spacing = -1 * Constants.tabApposition
        distribution = UIStackView.Distribution.fillEqually
    }
    
    /*
    private func render(viewState: ViewState?) {
        guard let viewState = viewState else { return }
        for viewState in viewState.tabViewStates {
            let tabButton: TabButtonProtocol = TabButton()
            tabButton.viewState = viewState
            addArrangedSubview(tabButton)
        }
    }
    */
    
    private func render(viewState: ViewState?) {
        guard let viewState = viewState else { return }
        
        let type: TabButton.ViewState.TabButtonType
        switch viewState.type {
        case .top:
            type = .top
        case .bottom:
            type = .bottom
        }
        
        for tab in viewState.tabs {
            let tabButtonViewState = createTabButtonViewState(type: type, for: tab)
            let tabButton: TabButtonProtocol = TabButton()
            tabButton.viewState = tabButtonViewState
            addArrangedSubview(tabButton)
        }

    }
    
    private func createTabButtonViewState(type: TabButton.ViewState.TabButtonType, for tab: Tabb) -> TabButton.ViewState {
        let tabButtonViewState = TabButton.ViewState(
            type: type,
            title: tab.type.tabTitle,
            color: tab.type.tabColor,
            tabAction: { })
        return tabButtonViewState
    }
    
}

// MARK: - Viewstate

extension TabBarView {
    
    struct ViewState {
        
        enum TabBarViewType {
            case top
            case bottom
        }
        
        let type: TabBarViewType
        let tabs: [Tabb]
        
    }
    
}

struct Tabb {
    
    let type: TabBarViewType
    
}

extension Tabb {
    
    enum TabBarViewType {
        
        case day
        case week
        case month
        
        var tabTitle: String {
            switch self {
            case .day:
                return "Day"
            case .week:
                return "Week"
            case .month:
                return "Month"
            }
        }
        
        var tabColor: UIColor {
            switch self {
            case .day:
                return .tabDayBackground
            case .week:
                return .tabWeekBackground
            case .month:
                return .tabMonthBackground
            }
        }
        
    }
    
}

