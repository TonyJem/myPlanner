import UIKit

extension DayPage.Calendar {
    
    final class TableCell: UICollectionViewCell {
        
        enum Constants {
            
        }
        
        // MARK: - Properties
        
        static let identifier = String(describing: TableCell.self)
        
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
                
        private lazy var dateLabel: UILabel = {
            let label = UILabel().autolayout()
            return label
        }()
        
        
        // MARK: - Init
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .systemOrange
            
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

extension DayPage.Calendar.TableCell {
    
    private func render(viewState: DayPage.Calendar.TableCell.ViewState?) {

    }
    
}

