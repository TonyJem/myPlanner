import UIKit

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
    
    private lazy var tabPanelView = BottomTabPanelView().autolayout()
    
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
        addSubview(tabPanelView)
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
            
            tabPanelView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: Constants.bottomTabPanelHorizontalInset),
            tabPanelView.topAnchor.constraint(equalTo: topAnchor),
            tabPanelView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: -1 * Constants.bottomTabPanelHorizontalInset),
            tabPanelView.heightAnchor.constraint(equalToConstant: Constants.bottomTabPanelHeight),

            showCalendarsButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                          constant: -1.5 * Constants.horizontalInset),
            showCalendarsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            showCalendarsButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
            
        ])
    }
    
}
