import UIKit


final class TabBarView: UIStackView {
    
    /// Holds the ViewState of the `TabBarView` and renders it when set.
    var viewState: ViewState = .initial {
        didSet {
            render(viewState: viewState)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        render(viewState: .initial)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        axis  = NSLayoutConstraint.Axis.horizontal
//        spacing = -1 * Constants.tabApposition
        distribution = UIStackView.Distribution.fillEqually
        backgroundColor = .blue
    }
    
    private func render(viewState: ViewState) {
        for viewState in viewState.tabViewStates {
            let tabButton: TabButtonProtocol = TabButton()
            tabButton.viewState = viewState
            addArrangedSubview(tabButton)
            tabButton.reloadLayer()
        }
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
        let tabViewStates: [TabButton.ViewState]
        
        
        static let initial: ViewState = ViewState(
            type: .top,
            tabViewStates: [
                TabButton.ViewState(type: .top, title: "initialTab1", color: .green)
            ]
        )
        
        init(type: TabBarViewType, tabViewStates: [TabButton.ViewState]) {
            self.type = type
            self.tabViewStates = tabViewStates
        }
        
    }
    
}

