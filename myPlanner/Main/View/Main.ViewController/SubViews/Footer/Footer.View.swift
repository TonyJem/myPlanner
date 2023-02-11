import UIKit

protocol FooterProtocol: UIView {
    
    /// Holds the ViewState of the `TabButton`
    var viewState: Footer.ViewState? { get set }
    
}

extension Footer {
    
    class View: UIView, FooterProtocol {
        
        enum Constants {
            
            static let tabBarViewWidth: CGFloat = 650.0
            static let tabBarViewHeight: CGFloat = 30.0
            
        }
        
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var tabBar: TabBarProtocol = {
            let view = TabBar.View().autolayout()
            return view
        }()
        
        // MARK: - Init
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
            addSubViews()
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        
        private func setupView() {
            backgroundColor = .systemGray
        }
        
        private func addSubViews() {
            addSubview(tabBar)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                tabBar.centerXAnchor.constraint(equalTo: centerXAnchor),
                tabBar.topAnchor.constraint(equalTo: topAnchor),
                tabBar.widthAnchor.constraint(equalToConstant: Constants.tabBarViewWidth),
                tabBar.heightAnchor.constraint(equalToConstant: Constants.tabBarViewHeight),
                
            ])
        }
        
        private func render(viewState: ViewState?) {
            guard let viewState = viewState else { return }
            tabBar.viewState = viewState.tabBarViewState
        }
        
    }
    
}
