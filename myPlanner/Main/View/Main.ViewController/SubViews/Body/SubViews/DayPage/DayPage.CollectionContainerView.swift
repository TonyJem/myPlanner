import UIKit

extension DayPage {
    
    final class CollectionContainerView: UIView {
        
        // MARK: - Properties
        
        var collectionViewDataSource: CollectionViewDataSource
        
        var onItemSelected: ((Date) -> Void)?
        
        // MARK: - SubViews
        
        private lazy var collectionView: UICollectionView = {
            var collectionView = UICollectionView(
                frame: .zero,
                collectionViewLayout: UICollectionViewLayout()
            ).autolayout()
            
            collectionView.isPagingEnabled = true
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            
            // TODO: - Check if we really need it and
            // learn what 'contentInsetAdjustmentBehavior' is doing
            collectionView.contentInsetAdjustmentBehavior = .always
            return collectionView
        }()
        
        // MARK: - Init
        
        init(dataSource: CollectionViewDataSource) {
            self.collectionViewDataSource = dataSource
            super.init(frame: .zero)
        }
        
        // TODO: - @available Need to find out what next row does and decide if we need to keep it in our app
        // Also think if we need to add it to other places
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        static func create(dataSource: CollectionViewDataSource) -> CollectionContainerView {
            let view = CollectionContainerView(dataSource: dataSource)
            view.setupCollectionView()
            return view
        }
        
        // MARK: - Private Methods
        
        private func setupCollectionView() {
            collectionViewDataSource.collectionView = collectionView
            addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.topAnchor.constraint(equalTo: topAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
            collectionView.setCollectionViewLayout(createCompositionalLayout(), animated: false)
            collectionView.collectionViewLayout.invalidateLayout()
            
            // TODO: Use it when need to use delegate methods
//            collectionView.delegate = self
        }
        
        private func createCompositionalLayout() -> UICollectionViewLayout {
            let configuration = UICollectionViewCompositionalLayoutConfiguration()
            configuration.scrollDirection = .horizontal
            let layout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            }, configuration: configuration)
            return layout
        }
        
    }
    
}
