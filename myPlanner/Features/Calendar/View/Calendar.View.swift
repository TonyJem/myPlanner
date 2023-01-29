import UIKit

extension Calendar {
    
    class View: UIView {
        
        var collectionViewDatasource: CollectionViewDatasource
        
        // MARK: - SubViews
        private lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).autolayout()
            return collectionView
        }()
        
        // MARK: - Init
        init(dataSource: CollectionViewDatasource) {
            self.collectionViewDatasource = dataSource
            super.init(frame: .zero)
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        static func create(dataSource: CollectionViewDatasource) -> Calendar.View {
            let view = Calendar.View(dataSource: dataSource)
            view.setup()
            return view
        }
        
        // MARK: - Private Methods
        private func setup() {
            backgroundColor = .white
            collectionViewDatasource.collectionView = collectionView
            addSubview(collectionView)
            setupLayout()
            collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.identifier)
            collectionView.delegate = self
        }
        
        // MARK: - CollectionView Layout
        
        func updateLayout(animated: Bool) {
            collectionView.setCollectionViewLayout(gridLayout, animated: animated)
            collectionView.collectionViewLayout.invalidateLayout()
        }
        
        private lazy var gridLayout: UICollectionViewLayout = {
            let layout = UICollectionViewCompositionalLayout(
                sectionProvider: { [weak self] (_, _) -> NSCollectionLayoutSection? in
                    guard let self = self else { return nil }
                    
                    let collectionViewWidth = self.collectionView.frame.width
                    
                    let numberOfColumns: CGFloat = 7.0
                    
                    let widthDimension: NSCollectionLayoutDimension = .fractionalWidth(1 / numberOfColumns)
                    let heightDimension: NSCollectionLayoutDimension = .fractionalHeight(1 / numberOfColumns)
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: widthDimension,
                        heightDimension: heightDimension
                    )
                    
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    
                    let itemInset: CGFloat = 5.0
                    
                    item.contentInsets = NSDirectionalEdgeInsets(
                        top: itemInset,
                        leading: itemInset,
                        bottom: itemInset,
                        trailing: itemInset
                    )
                    
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: heightDimension
                    )
                    
                    let group = NSCollectionLayoutGroup.horizontal(
                        layoutSize: groupSize,
                        subitems: [item]
                    )
                    
                    let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = NSDirectionalEdgeInsets(
                        top: 2,
                        leading: 2,
                        bottom: 2,
                        trailing: 2
                    )
                    return section
                }
                
            )
            return layout
        }()
        
    }
    
}

// MARK: - SetConstraints
extension Calendar.View {
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}



// MARK: - CollectionView Delegate
extension Calendar.View: UICollectionViewDelegate {
    
}
