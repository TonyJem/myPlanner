import UIKit

extension Header {
    
    class View: UIView {
        
        enum Constants {
            
            static let dateViewWidth: CGFloat = 120.0
            static let dateViewHeight: CGFloat = 30.0
            
            static let tabBarViewWidth: CGFloat = 400.0
            static let tabBarViewHeight: CGFloat = 30.0
            
        }
        
        // MARK: - SubViews
        
        private lazy var dateView: UIView = {
            let view = UIView().autolayout()
            view.backgroundColor = .orange
            return view
        }()
        
        private lazy var tabBarView: UIView = {
            let view = UIView().autolayout()
            view.backgroundColor = .blue
            return view
        }()
        
        private lazy var searchButton: UIButton = {
            let button = UIButton().autolayout()
            button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(didTapOnSearchButton), for: .touchUpInside)
            return button
        }()
        
        private lazy var settingsButton: UIButton = {
            let button = UIButton().autolayout()
            button.setImage(UIImage(systemName: "gearshape"), for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(didTapOnSettingsButton), for: .touchUpInside)
            return button
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
        
        // MARK: - Actions
        @objc private func didTapOnSearchButton() {
            print("🟢 didTapOnSearchButton in Header.View")
        }
        
        @objc private func didTapOnSettingsButton() {
            print("🟢 didTapOnSearchButton in Header.View")
        }
                            
        
        // MARK: - Private Methods
        
        private func setupView() {
            backgroundColor = .systemGray
        }
        
        private func addSubViews() {
            addSubview(dateView)
            addSubview(tabBarView)
            addSubview(searchButton)
            addSubview(settingsButton)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                dateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacingL),
                dateView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.spacingXXS),
                dateView.widthAnchor.constraint(equalToConstant: Constants.dateViewWidth),
                dateView.heightAnchor.constraint(equalToConstant: Constants.dateViewHeight),
                
                tabBarView.centerXAnchor.constraint(equalTo: centerXAnchor),
                tabBarView.bottomAnchor.constraint(equalTo: bottomAnchor),
                tabBarView.widthAnchor.constraint(equalToConstant: Constants.tabBarViewWidth),
                tabBarView.heightAnchor.constraint(equalToConstant: Constants.tabBarViewHeight),
                
                settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacingL),
                settingsButton.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                searchButton.trailingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: -.spacingL),
                searchButton.bottomAnchor.constraint(equalTo: bottomAnchor),
                
            ])
        }
        
    }
    
}
