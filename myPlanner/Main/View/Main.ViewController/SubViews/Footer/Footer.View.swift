/*
 class FooterView: UIView {

     enum Constants {
         
         static let bottomTabPanelHeight: CGFloat = 30.0
         static let bottomTabPanelHorizontalInset: CGFloat = 130.0
         
         static let horizontalInset: CGFloat = 20.0
         static let buttonHeight: CGFloat = 40.0
         
     }
     
     // MARK: - Views
     private lazy var todayButton: UIButton = {
         let button = UIButton().autolayout()
         button.setTitle("BottomPanel.TodayButton.Title".localized, for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.addTarget(self, action: #selector(todayButtonDidTap), for: .touchUpInside)
         return button
     }()
     
     
     private lazy var showCalendarsButton: UIButton = {
         let button = UIButton().autolayout()
         button.setImage(UIImage(named: "show_calendars_18"), for: .normal)
         button.addTarget(self, action: #selector(showCalendarsButtonDidTap), for: .touchUpInside)
         return button
     }()
     
     // MARK: - Init
     override init(frame: CGRect) {
         super.init(frame: frame)
         
         backgroundColor = .gray
         
         setupViews()
         setConstraints()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     // MARK: - Actions
     @objc private func todayButtonDidTap() {
         print("🟢 todayButtonDidTap in FooterView")
     }
     
     @objc private func showCalendarsButtonDidTap() {
         print("🟢🟢 showCalendarsButtonDidTap in FooterView")
     }
     
     // MARK: - Private Methods
     private func setupViews() {
         addSubview(todayButton)
         addSubview(showCalendarsButton)
     }
 }

 // MARK: - SetConstraints
 extension FooterView {
     
     private func setConstraints() {
         NSLayoutConstraint.activate([
             
             todayButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: Constants.horizontalInset),
             todayButton.centerYAnchor.constraint(equalTo: centerYAnchor),
             todayButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),

             showCalendarsButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                           constant: -1.5 * Constants.horizontalInset),
             showCalendarsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
             showCalendarsButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
             
         ])
     }
     
 }
 */

import UIKit

protocol FooterProtocol: UIView {
    
    /// Holds the ViewState of the `TabButton`
    var viewState: Footer.ViewState? { get set }
    
}

extension Footer {
    
    class View: UIView, FooterProtocol {
        
        enum Constants {
            
            static let tabBarViewWidth: CGFloat = 850.0
            static let tabBarViewHeight: CGFloat = 30.0
            
        }
        
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var tabBar: MonthTabBarProtocol = {
            let view = Footer.MonthTabBar.View().autolayout()
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
