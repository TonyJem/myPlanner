import UIKit

extension Calendar {
    
    class Cell: UICollectionViewCell {
        
        static let identifier = String(describing: Cell.self)
        
        // MARK: - SubViews
        var label: UILabel = {
            let label = UILabel().autolayout()
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
            contentView.backgroundColor = .white
            addSubview(label)
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
