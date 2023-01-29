import UIKit

extension Calendar {
    
    class View: UIView {
        
        // MARK: - SubViews
        private lazy var title: UILabel = {
            let label = UILabel().autolayout()
            label.text = "Calendar"
            return label
        }()
        
        private lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).autolayout()
            return collectionView
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
            
            addSubview(collectionView)
            
            addSubview(title)
        }
        
    }
    
}

// MARK: - SetConstraints
extension Calendar.View {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: .spacingS),
            title.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}
