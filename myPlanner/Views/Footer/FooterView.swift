import UIKit

class FooterView: UIView {
    
    // MARK: - Views
    private lazy var todayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Today", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(todayButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tabPanelView = BottomTabPanelView()
    
    private lazy var showCalendarsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "show_calendars_18"), for: .normal)
        button.addTarget(self, action: #selector(showCalendarsButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
        
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
                                                 constant: Constants.Layout.horizontalInset),
            todayButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            todayButton.heightAnchor.constraint(equalToConstant: Constants.Layout.buttonHeight)
        ])
        
        NSLayoutConstraint.activate([
            tabPanelView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: Constants.BottomTabPanel.horizontalInset),
            tabPanelView.topAnchor.constraint(equalTo: topAnchor),
            tabPanelView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: -1 * Constants.BottomTabPanel.horizontalInset),
            tabPanelView.heightAnchor.constraint(equalToConstant: Constants.BottomTabPanel.height)
        ])
        
        NSLayoutConstraint.activate([
            showCalendarsButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                          constant: -1.5 * Constants.Layout.horizontalInset),
            showCalendarsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            showCalendarsButton.heightAnchor.constraint(equalToConstant: Constants.Layout.buttonHeight)
        ])
    }
}
