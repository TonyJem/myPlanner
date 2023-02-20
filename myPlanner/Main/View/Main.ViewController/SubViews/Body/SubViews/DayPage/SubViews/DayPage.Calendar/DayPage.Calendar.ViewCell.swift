import UIKit

extension DayPage.Calendar {
    
    final class ViewCell: UICollectionViewCell {
        
        enum Constants {
            
        }
        
        // MARK: - Properties
        
        static let identifier = String(describing: ViewCell.self)
        
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
                
        private lazy var dateLabel: UILabel = {
            let label = UILabel().autolayout()
            label.text = "88"
            return label
        }()
        
        
        // MARK: - Init
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubViews()
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
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

extension DayPage.Calendar.ViewCell {
    
    private func render(viewState: DayPage.Calendar.ViewCell.ViewState?) {

    }
    
}

