import UIKit

extension Main {
    
    class ViewController: UIViewController {
        
        enum Constants {
            
            static let headerHeight: CGFloat = 63.0
            static let footerHeight: CGFloat = 36.0
            
        }
        
        private let presenter: Presenter
        
        /// Holds the viewStateContainer of the `ViewController`
        private var viewStateContainer: ViewStateContainer?
        
        // MARK: - SubViews
        
        private lazy var header: HeaderViewProtocol = {
            let view = Header.View().autolayout()
            return view
        }()
        
        private lazy var body: BodyViewProtocol = {
            let view = Body.View().autolayout()
            return view
        }()
        
        private lazy var footer: FooterViewProtocol = {
            let view = Footer.View().autolayout()
            return view
        }()
        
        // MARK: - LifeCycle
        
        init(presenter: Presenter) {
            self.presenter = presenter
            super.init(nibName: nil, bundle: nil)
        }
        
    //TODO: - Need to find out what next row does and decide if we need to keep it in our app
        // Also think if we need to add it to other places
        @available(*, unavailable)
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - LifeCycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            addSubViews()
            setupLayout()
            
            presenter.viewDidLoad()
        }
        
        // MARK: - Private Methods
        
        private func setupView() {
        }
        
        private func addSubViews() {
            view.addSubview(header)
            view.addSubview(body)
            view.addSubview(footer)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                header.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                header.topAnchor.constraint(equalTo: view.topAnchor),
                header.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                header.heightAnchor.constraint(equalToConstant: Constants.headerHeight),

                footer.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                footer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                footer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                footer.heightAnchor.constraint(equalToConstant: Constants.footerHeight),

                body.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                body.topAnchor.constraint(equalTo: header.bottomAnchor),
                body.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                body.bottomAnchor.constraint(equalTo: footer.topAnchor)
                
            ])
        }
        
    }
    
}

// MARK: - Implementation of MainView protocol:

extension Main.ViewController: MainView {
    
    func render(viewStateContainer: Main.ViewStateContainer) {
        self.viewStateContainer = viewStateContainer
        header.viewState = viewStateContainer.headerViewState
        body.viewState = viewStateContainer.bodyViewState
        footer.viewState = viewStateContainer.footerViewState
    }
    
}
