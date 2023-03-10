import UIKit

protocol MonthTabBarProtocol: UIStackView {
    
    /// Holds the ViewState of the `MonthTabBar`
    var viewState: Footer.MonthTabBar.ViewState? { get set }
    
}

extension Footer.MonthTabBar {
    
    class View: UIStackView, MonthTabBarProtocol {
        
        enum Constants {
            
            static let tabApposition: CGFloat = .spacingXS
            
        }
        
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
            
            let position: MonthTabButton.ViewState.TabButtonPosition
            switch viewState.position {
            case .top:
                position = .top
            case .bottom:
                position = .bottom
            }
            
            for tab in viewState.tabs {
                let tabButtonViewState = createTabButtonViewState(position: position, for: tab)
                let tabButton: MonthTabButtonProtocol = MonthTabButton()
                tabButton.viewState = tabButtonViewState
                addArrangedSubview(tabButton)
            }
            
        }
        
        private func createTabButtonViewState(position: MonthTabButton.ViewState.TabButtonPosition, for tab: Footer.MonthTab) -> MonthTabButton.ViewState {
            
            return MonthTabButton.ViewState(
                position: position,
                monthTabType: tab.type,
                title: tab.type.tabTitle,
                color: tab.type.tabColor,
                isActive: tab.isActive,
                tabAction: tab.action)
        }
        
    }
    
}

