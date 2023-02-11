import UIKit

protocol FooterProtocol: UIView {
    
    /// Holds the ViewState of the `TabButton`
    var viewState: Footer.ViewState? { get set }
    
}

extension Footer {
    
    class View: UIView, FooterProtocol {
        
        /// Holds the ViewState of the `Header.View` and renders it when set.
        var viewState: ViewState? {
            didSet {
//                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var subView = UIView().autolayout()
        
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
            backgroundColor = .systemPink
        }
        
        private func addSubViews() {
            addSubview(subView)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                subView.leadingAnchor.constraint(equalTo: leadingAnchor),
                subView.topAnchor.constraint(equalTo: topAnchor),
                subView.trailingAnchor.constraint(equalTo: trailingAnchor),
                subView.bottomAnchor.constraint(equalTo: bottomAnchor)
                
            ])
        }
        
        private func render(viewState: ViewState?) {
            guard let viewState = viewState else { return }
//            tabBar.viewState = viewState.tabBarViewState
        }
        
    }
    
}
