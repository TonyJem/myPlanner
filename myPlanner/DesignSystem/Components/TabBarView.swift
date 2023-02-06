import UIKit

protocol TabBarViewCoordinator: AnyObject {
    
    func onDayTab()
    
    func onWeekTab()
    
    func onMonthTab()
    
    func onTasksTab()
    
    func onNotesTab()
    
}

final class TabBarView: UIStackView {
    
    enum Constants {
        
        static let tabApposition: CGFloat = .spacingXS
        
    }
    
    weak var coordinator: TabBarViewCoordinator?
    
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
        
        coordinator = viewState.coordinator
        
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
        
        let action: (() -> Void)
        
        if let coordinator = coordinator {
            switch tab.type {
            case .day:
                action = {
                    coordinator.onDayTab()
                }
            case .week:
                action = {
                    coordinator.onWeekTab()
                }
            case .month:
                action = {
                    coordinator.onMonthTab()
                }
            case .tasks:
                action = {
                    coordinator.onTasksTab()
                }
            case .notes:
                action = {
                    coordinator.onNotesTab()
                }
            }
        } else {
            action = { }
        }
        
        let tabButtonViewState = TabButton.ViewState(
            type: type,
            title: tab.type.tabTitle,
            color: tab.type.tabColor,
            tabAction: action
        )
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
        let coordinator: Main.Presenter
        let tabs: [PageTab]
        
    }
    
}

struct PageTab {
    
    let type: TabBarViewType
    
}

extension PageTab {
    
    enum TabBarViewType {
        
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
