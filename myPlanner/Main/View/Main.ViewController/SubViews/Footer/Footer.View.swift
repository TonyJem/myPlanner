import UIKit

protocol FooterProtocol: UIView {
    
    /// Holds the ViewState of the `TabButton`
    var viewState: Footer.ViewState? { get set }
    
}

extension Footer {
    
    class View: UIView, FooterProtocol {
        
        enum Constants {
            
            static let tabBarViewHeight: CGFloat = 30.0
            static let buttonSize = CGSize(width: 40, height: 40)
            
        }
        
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var todayButton: UIButton = {
            let button = UIButton().autolayout()
            button.setTitle("Footer.TodayButton.Title".localized, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(didTapOnTodayButton), for: .touchUpInside)
            return button
        }()
        
        private lazy var tabBar: MonthTabBarProtocol = {
            let view = Footer.MonthTabBar.View().autolayout()
            return view
        }()
        
        private lazy var calendarsButton: IconButton = {
            let button = IconButton(systemName: "calendar").autolayout()
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
        
        @objc private func didTapOnTodayButton() {
            print("🟢 didTapOnTodayButton in Footer.View")
        }

        // MARK: - Private Methods
        
        private func setupView() {
            backgroundColor = .systemGray
        }
        
        private func addSubViews() {
            addSubview(todayButton)
            addSubview(tabBar)
            addSubview(calendarsButton)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                todayButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacingL),
                todayButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                todayButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height),
                todayButton.widthAnchor.constraint(equalToConstant: todayButton.intrinsicContentSize.width + .spacingXS),
                
                tabBar.leadingAnchor.constraint(equalTo: todayButton.trailingAnchor, constant: .spacingL),
                tabBar.topAnchor.constraint(equalTo: topAnchor),
                tabBar.trailingAnchor.constraint(equalTo: calendarsButton.leadingAnchor, constant: -.spacingL),
                tabBar.heightAnchor.constraint(equalToConstant: Constants.tabBarViewHeight),
                
                calendarsButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width),
                calendarsButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height),
                calendarsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacingL),
                calendarsButton.centerYAnchor.constraint(equalTo: centerYAnchor)
                
            ])
        }
        
        private func render(viewState: ViewState?) {
            guard let viewState = viewState else { return }
            tabBar.viewState = viewState.tabBarViewState
        }
        
    }
    
}
