import UIKit

protocol PageTabBarProtocol: UIStackView {
    
    /// Holds the ViewState of the `PageTabBar`
    var viewState: Header.PageTabBar.ViewState? { get set }
    
}

extension Header.PageTabBar {
    
    class View: UIStackView, PageTabBarProtocol {
        
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
            
            let type: TabButton.ViewState.TabButtonPosition
            switch viewState.type {
            case .top:
                type = .top
            case .bottom:
                type = .bottom
            }
            
            for tab in viewState.tabs {
                let tabButtonViewState = createTabButtonViewState(position: type, for: tab)
                let tabButton: TabButtonProtocol = TabButton()
                tabButton.viewState = tabButtonViewState
                addArrangedSubview(tabButton)
            }
            
        }
        
        private func createTabButtonViewState(position: TabButton.ViewState.TabButtonPosition, for tab: Header.PageTab) -> TabButton.ViewState {
            
            return .init(
                position: position,
                pageTabType: tab.type,
                title: tab.type.tabTitle,
                color: tab.type.tabColor,
                isActive: tab.isActive,
                tabAction: tab.action
            )
        }
        
    }
    
}
