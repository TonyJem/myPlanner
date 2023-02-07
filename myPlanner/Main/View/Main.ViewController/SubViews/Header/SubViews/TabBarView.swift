import UIKit

extension Header {
    
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
            
            return .init(
                type: type,
                pageTabType: tab.type,
                title: tab.type.tabTitle,
                color: tab.type.tabColor,
                isActive: tab.isActive,
                tabAction: tab.action
            )
        }
        
    }
    
}

// MARK: - Viewstate

extension Header.TabBarView {
    
    struct ViewState {
        
        enum TabBarViewType {
            case top
            case bottom
        }
        
        let type: TabBarViewType
        let tabs: [PageTab]
        
    }
    
}
