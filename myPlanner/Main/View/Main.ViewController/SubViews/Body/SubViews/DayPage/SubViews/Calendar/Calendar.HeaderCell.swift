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
        
        private lazy var titleLabel: UILabel = {
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
        
        // MARK: - Private Methods
        
        private func addSubViews() {
            addSubview(titleLabel)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
                
            ])
        }
        
    }
    
}

extension DayPage.Calendar.HeaderCell {
    
    private func render(viewState: DayPage.Calendar.HeaderCell.ViewState?) {
        guard let viewState = viewState else { return }
        titleLabel.text = viewState.title
    }
    
}
