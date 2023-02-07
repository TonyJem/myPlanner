import UIKit

// TODO: Think if we need to move it under "Header" extension and make it PagesTab bar or etc. more meaningfull
final class TabBarView: UIStackView {
    
    enum Constants {
        
        static let tabApposition: CGFloat = .spacingXS
        
    }
    
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
        spacing = -Constants.tabApposition
        distribution = UIStackView.Distribution.fillEqually
    }
    
    private func render(viewState: ViewState?) {
        guard let viewState = viewState else { return }
        
        removeAllArrangedSubviews()
        
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
    
    private func createTabButtonViewState(type: TabButton.ViewState.TabButtonType, for tab: PageTab) -> TabButton.ViewState {
        .init(
            type: type,
            title: tab.type.tabTitle,
            color: tab.type.tabColor,
            isActive: tab.isActive,
            tabAction: tab.action
        )
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
        let tabs: [PageTab]
        
    }
    
}

struct PageTab {
    
    let type: PageTabType
    let isActive: Bool
    let action: (() -> Void)
    
    init(
        type: PageTabType,
        isActive: Bool = false,
        action: @escaping (() -> Void))
    {
        self.type = type
        self.isActive = isActive
        self.action = action
    }
    
}

extension PageTab {
    
    enum PageTabType {
        
        case day
        case week
        case month
        case tasks
        case notes
        
        var tabTitle: String {
            switch self {
            case .day:
                return "Day"
            case .week:
                return "Week"
            case .month:
                return "Month"
            case .tasks:
                return "Tasks"
            case .notes:
                return "Notes"
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
            case .tasks:
                return .tabTasksBackground
            case .notes:
                return .tabNotesBackground
            }
        }
        
    }
    
}
