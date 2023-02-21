import UIKit

extension DayPage.Calendar {
    
    // TODO: Check all classes and make sure all relevant classes are final
    // Learn differences about final and not final classes
    final class CollectionContainerView: UIView {
        
        // MARK: - Properties
        
        var collectionViewDataSource: CollectionViewDataSource
        
        // MARK: - SubViews
        
        private lazy var collectionView: UICollectionView = {
            var collectionView = UICollectionView(
                frame: .zero,
                collectionViewLayout: UICollectionViewLayout()
            ).autolayout()
            
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
            view.setup()
            return view
        }
        
        // MARK: - Public Methods
        
        func updateLayout(animated: Bool) {
            collectionView.setCollectionViewLayout(createCompositionalLayout(), animated: animated)
            collectionView.collectionViewLayout.invalidateLayout()
        }
        
        // MARK: - Private Methods
        
        private func setup() {
            collectionViewDataSource.collectionView = collectionView
            addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.topAnchor.constraint(equalTo: topAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
            collectionView.register(MonthDayCell.self, forCellWithReuseIdentifier: MonthDayCell.identifier)
            collectionView.register(WeekDayCell.self, forCellWithReuseIdentifier: WeekDayCell.identifier)
        }
        
    }
    
}

// MARK: - CollectionContainerView Layout

extension DayPage.Calendar.CollectionContainerView {
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/7),
                heightDimension: .fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/7)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        return layout
    }
    
}
