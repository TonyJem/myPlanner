import UIKit

extension DayPage.Calendar {
    
    final class HeaderCell: UICollectionViewCell {
        
        enum Constants {
            
        }
        
        // MARK: - Properties
        
        static let identifier = String(describing: HeaderCell.self)
        
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var dateLabel: UILabel = {
            let label = UILabel().autolayout()
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            return label
        }()
        
        // MARK: - Init
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .systemTeal
            
            addSubViews()
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Temporary Public Methods
        
        func setLabel(text: String) {
            dateLabel.text = text
        }
        
        // MARK: - Private Methods
        
        private func addSubViews() {
            addSubview(dateLabel)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
                
            ])
        }
        
    }
    
}

extension DayPage.Calendar.HeaderCell {
    
    private func render(viewState: DayPage.Calendar.HeaderCell.ViewState?) {

    }
    
}
