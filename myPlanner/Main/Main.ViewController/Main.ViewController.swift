import UIKit

extension Main {
    
    class ViewController: UIViewController {
        
        enum Constants {
            
            static let headerViewHeight: CGFloat = 63.0
            static let footerViewHeight: CGFloat = 36.0
            
        }
        
        // MARK: - Views
        private lazy var headerView = HeaderView().autolayout()
        private lazy var mainView = View().autolayout()
        private lazy var footerView = FooterView().autolayout()
        
        // MARK: - LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setupViews()
            setConstraints()
        }
        
        // MARK: - Private Methods
        private func setupViews() {
            view.addSubview(headerView)
            view.addSubview(mainView)
            view.addSubview(footerView)
        }
        
        private func setConstraints() {
            NSLayoutConstraint.activate([
                
                headerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                headerView.topAnchor.constraint(equalTo: view.topAnchor),
                headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                headerView.heightAnchor.constraint(equalToConstant: Constants.headerViewHeight),

                footerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                footerView.heightAnchor.constraint(equalToConstant: Constants.footerViewHeight),

                mainView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                mainView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                mainView.bottomAnchor.constraint(equalTo: footerView.topAnchor)
                
            ])
        }
        
    }
    
}
