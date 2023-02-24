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
                    
                    
                    // TODO: Refactor or delete it when be creating real DateView
                    // The START of MockedData for DateView
                    let title = "Day: \(indexPath.item)"
                    let date = "\(indexPath.item)"
                    let subtitle = "\(indexPath.item)TH DAY, 337 LEFT, WEEK 4"
                    let dateViewState = DayPage.DateView.ViewState(
                        title: title,
                        date: date,
                        subtitle: subtitle
                    )
                    cell?.renderDate(viewState: dateViewState)
                    // The END of MockedData for DateView
                    
                    
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

