import UIKit

protocol HeaderViewProtocol: UIView {
    
    /// Holds the ViewState of the `Header`
    var viewState: Header.ViewState? { get set }
    
}

extension Header {
    
    class View: UIView {
        
        enum Constants {
            
            static let dateViewWidth: CGFloat = 120.0
            static let dateViewHeight: CGFloat = 30.0
            
            static let tabBarViewWidth: CGFloat = 500.0
            static let tabBarViewHeight: CGFloat = 30.0
            
            static let buttonSize = CGSize(width: 40, height: 40)
            
        }
        
        /// Holds the ViewState of the `Header.View` and renders it when set.
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel().autolayout()
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
            return label
        }()
        
        private lazy var tabBar: PageTabBarProtocol = {
            let view = PageTabBar.View().autolayout()
            return view
        }()
        
        private lazy var searchButton: IconButton = {
            let button = IconButton(systemName: "magnifyingglass").autolayout()
            button.addTarget(self, action: #selector(didTapOnSearchButton), for: .touchUpInside)
            return button
        }()
        
        
        private lazy var settingsButton: IconButton = {
            let button = IconButton(systemName: "gearshape").autolayout()
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
            print("🐭🐹🦄🦋 didTapOnSearchButton in Header.View")
        }
        
        @objc private func didTapOnSettingsButton() {
            print("🥳🤩😍💩😻🫶🏻🤑 didTapOnSearchButton in Header.View")
        }
        
        
        // MARK: - Private Methods
        
        private func setupView() {
            backgroundColor = .systemGray
        }
        
        private func addSubViews() {
            addSubview(titleLabel)
            addSubview(tabBar)
            addSubview(searchButton)
            addSubview(settingsButton)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacingL),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.spacingXXS),
                
                tabBar.centerXAnchor.constraint(equalTo: centerXAnchor),
                tabBar.bottomAnchor.constraint(equalTo: bottomAnchor),
                tabBar.widthAnchor.constraint(equalToConstant: Constants.tabBarViewWidth),
                tabBar.heightAnchor.constraint(equalToConstant: Constants.tabBarViewHeight),
                
                settingsButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width),
                settingsButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height),
                settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacingL),
                settingsButton.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                searchButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width),
                searchButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height),
                searchButton.trailingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: -.spacingS),
                searchButton.bottomAnchor.constraint(equalTo: bottomAnchor),
                
            ])
        }
        
    }
    
}

// TODO: Make sure all protocols are implemented like this template
// in extension and in Mark is only name of protocol and nothing else

// MARK: - HeaderViewProtocol:

extension Header.View: HeaderViewProtocol {
    
    private func render(viewState: Header.ViewState?) {
        guard let viewState = viewState else { return }
        tabBar.viewState = viewState.tabBarViewState
        
        // TODO: Need to show month as a number only if titleLabel is too wide
        // it happens while device is rotated vertically
        titleLabel.text = "\(viewState.month) \(viewState.year)"
    }
    
}
