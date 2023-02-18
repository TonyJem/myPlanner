import UIKit

extension DayPage.Date {
    
    final class View: UIView {
        
        // MARK: - Sub Views
        private lazy var title: UILabel = {
            let label = UILabel().autolayout()
            label.numberOfLines = 1
            label.textColor = .systemGray
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 32, weight: .light)
            return label
        }()
        
        private lazy var date: UILabel = {
            let label = UILabel().autolayout()
            label.numberOfLines = 1
            label.textColor = .systemOrange
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 144, weight: .ultraLight)
            return label
        }()
        
        private lazy var subtitle: UILabel = {
            let label = UILabel().autolayout()
            label.numberOfLines = 1
            label.textColor = .systemGray
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            return label
        }()
        
        // MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        private func setupViews() {
            backgroundColor = .white
            addSubview(title)
            addSubview(date)
            addSubview(subtitle)
        }
        
        func renderDate(viewState: DayPage.Date.ViewState) {
            title.text = viewState.title
            date.text = viewState.date
            subtitle.text = viewState.subtitle
        }
        
    }
    
}

// MARK: - SetConstraints
extension DayPage.Date.View {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: .spacingS),
            title.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor),
            
            date.centerXAnchor.constraint(equalTo: centerXAnchor),
            date.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            subtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.spacingL),
            subtitle.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor)
            
        ])
    }
    
}
