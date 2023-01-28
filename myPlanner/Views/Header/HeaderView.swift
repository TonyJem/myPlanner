import UIKit

class HeaderView: UIView {
    
    enum Constants {
        
        static let height: CGFloat = 30.0
        static let horizontalInset: CGFloat = 315.0
        static let tabApposition: CGFloat = 7.0
        
    }
    
    // MARK: - Views
    private let tabPanelView = TopTabPanelView()
    
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
    
    // MARK: - Private Methods
    private func setupViews() {
        addSubview(tabPanelView)
    }
}

// MARK: - SetConstraints
extension HeaderView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            tabPanelView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: Constants.horizontalInset),
            tabPanelView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tabPanelView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: -1 * Constants.horizontalInset),
            tabPanelView.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
        
    }
}
