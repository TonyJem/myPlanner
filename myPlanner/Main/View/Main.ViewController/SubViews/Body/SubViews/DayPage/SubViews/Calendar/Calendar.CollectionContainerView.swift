import UIKit

extension DayPage.Calendar {
    
    // TODO: Check all classes and make sure all relevant classes are final
    // Learn differences about final and not final classes
    // Create short conspect - quick reminder for me, in order when I need to look at it later
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
            
            collectionView.isScrollEnabled = false
            
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
            
            collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
            collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: HeaderCell.identifier)
            
            collectionView.setCollectionViewLayout(createCompositionalLayout(), animated: false)
            collectionView.collectionViewLayout.invalidateLayout()
            
            collectionView.delegate = self
        }
        
        private func createCompositionalLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/7),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1/6)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
            return layout
        }
        
    }
    
}

// MARK: - CollectionView Delegate

extension DayPage.Calendar.CollectionContainerView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("🟢 didDeselectItemAt section: \(indexPath.section) item: \(indexPath.item)")
        
        let cellViewState = collectionViewDataSource.sections[indexPath.section].items[indexPath.item]
        
        print("🟢🟢 Cell Title: \(cellViewState.title)")
        
        onItemSelected?(cellViewState.date)
        
    }
    
}
