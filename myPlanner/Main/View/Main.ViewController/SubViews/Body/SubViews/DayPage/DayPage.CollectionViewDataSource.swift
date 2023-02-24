import UIKit

extension DayPage {
    
    final class CollectionViewDataSource {
        
        enum Section {
            case main
        }
        
        // MARK: - Properties
        
        var collectionView: UICollectionView?
        
        var itemViewStates: [CollectionViewCell.ViewState] = []
        
        lazy var dataSource: UICollectionViewDiffableDataSource<Section, CollectionViewCell.ViewState> = {
            guard let collectionView = collectionView else {
                fatalError("Calendar CollectionView should be available")
            }
            
            let dataSource = UICollectionViewDiffableDataSource<Section, CollectionViewCell.ViewState>(
                collectionView: collectionView,
                cellProvider: { (collectionView, indexPath, itemViewState) -> UICollectionViewCell? in
                    
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
                    
                    cell?.viewState = itemViewState
                    
                    return cell
                    
                }
                
            )
            
            return dataSource
        }()
        
        // MARK: - Public Methods
        
        func update(_ itemViewStates: [CollectionViewCell.ViewState], animated: Bool) {
            self.itemViewStates = itemViewStates
            updateData(animated: animated)
        }
        
        // MARK: - Private Methods
        
        private func updateData(animated: Bool) {
            var snapshot = NSDiffableDataSourceSnapshot<Section, CollectionViewCell.ViewState>()
            snapshot.appendSections([.main])
            snapshot.appendItems(itemViewStates)
            dataSource.apply(snapshot, animatingDifferences: animated)
        }
        
    }
    
}

