import UIKit

extension Calendar {
    
    class Cell: UICollectionViewCell {
        
        static let identifier = String(describing: Cell.self)
        
        var viewState: CollectionViewCell.ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        private lazy var label: UILabel = {
            let label = UILabel().autolayout()
            label.numberOfLines = 1
            label.textAlignment = .center
            return label
        }()
        
        // MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        private func setup() {
            contentView.backgroundColor = .white
            addSubview(label)
        }
        
        private func render(viewState: CollectionViewCell.ViewState?) {
            guard let viewState = viewState else { return }
            label.text = viewState.text
            
            switch viewState.type {
            case .weekDay:
                label.textColor = .systemGray
                label.font = UIFont.systemFont(ofSize: 13, weight: .light)
            case .date:
                label.textColor = .black
                label.font = UIFont.systemFont(ofSize: 15, weight: .light)
            }
        }
        
    }
    
}

// MARK: - SetConstraints
extension Calendar.Cell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
}
