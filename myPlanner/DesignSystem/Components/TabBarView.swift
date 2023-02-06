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
    
    private func render(viewState: ViewState?) {
        guard let viewState = viewState else { return }
        for viewState in viewState.tabViewStates {
            let tabButton: TabButtonProtocol = TabButton()
            tabButton.viewState = viewState
            addArrangedSubview(tabButton)
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
        
    }
    
}

