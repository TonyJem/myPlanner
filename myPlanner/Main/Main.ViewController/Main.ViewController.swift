import UIKit

extension Main {
    
    class ViewController: UIViewController {
        
        enum Constants {
            
            static let headerViewHeight: CGFloat = 63.0
            static let footerViewHeight: CGFloat = 36.0
            
        }
        
        // MARK: - SubViews
        
        private lazy var headerView = Header.View().autolayout()
        private lazy var bodyView = Body.View().autolayout()
        private lazy var footerView = Footer.View().autolayout()
        
        // MARK: - LifeCycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            addSubViews()
            setupLayout()
        }
        
        // MARK: - Private Methods
        
        private func setupView() {
        }
        
        private func addSubViews() {
            view.addSubview(headerView)
            view.addSubview(bodyView)
            view.addSubview(footerView)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                headerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                headerView.topAnchor.constraint(equalTo: view.topAnchor),
                headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                headerView.heightAnchor.constraint(equalToConstant: Constants.headerViewHeight),

                footerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                footerView.heightAnchor.constraint(equalToConstant: Constants.footerViewHeight),

                bodyView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                bodyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bodyView.bottomAnchor.constraint(equalTo: footerView.topAnchor)
                
            ])
        }
        
    }
    
}
