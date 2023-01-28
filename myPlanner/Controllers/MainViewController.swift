import UIKit

class MainViewController: UIViewController {
    
    enum Constants {
        
        static private let headerHeightMultiplier: CGFloat = 0.075
        static let headerViewHeight = UIScreen.main.bounds.height * headerHeightMultiplier
        
        static private let footerHeightMultiplier: CGFloat = 0.04375
        static let footerViewHeight = UIScreen.main.bounds.height * footerHeightMultiplier
        
    }
    
    // MARK: - Views
    private let headerView = HeaderView()
    private let mainView = MainView()
    private let footerView = FooterView()
    
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
}

// MARK: - SetConstraints
extension MainViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constants.headerViewHeight)
        ])
        
        NSLayoutConstraint.activate([
            footerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            footerView.heightAnchor.constraint(equalToConstant: Constants.footerViewHeight)
        ])
        
        NSLayoutConstraint.activate([
            mainView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            mainView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: footerView.topAnchor)
        ])
    }
}
