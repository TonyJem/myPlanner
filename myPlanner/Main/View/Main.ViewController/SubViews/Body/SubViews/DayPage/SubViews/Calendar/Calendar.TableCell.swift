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
        
        private lazy var titleLabel: UILabel = {
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

extension DayPage.Calendar.TableCell {
    
    private func render(viewState: DayPage.Calendar.TableCell.ViewState?) {
        guard let viewState = viewState else { return }
        titleLabel.text = viewState.title
        updateUI(with: viewState.config)
    }
    
    private func updateUI(with configuration: DayPage.Calendar.ViewState.Configuration?) {
        guard let configuration = configuration else { return }
        switch configuration {
        case .previuos:
            backgroundColor = .systemGray
        case .current:
            backgroundColor = .orange
        case .currentSelected:
            backgroundColor = .systemCyan
        case .today:
            backgroundColor = .green
        case .todaySelected:
            backgroundColor = .systemRed
        case .upcoming:
            backgroundColor = .systemGray
        }
    }
    
}
