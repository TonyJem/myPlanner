import UIKit

// TODO: - Is needed only for tests, which are not created yet.
protocol CalendarCollectionViewDataSourceProtocol {
    
}

extension DayPage.Calendar {
    
    final class CollectionViewDataSource: CalendarCollectionViewDataSourceProtocol {
        
        typealias Section = DayPage.Calendar.Section
        typealias ViewState = DayPage.Calendar.CollectionViewCell.ViewState
        typealias HeaderCell = DayPage.Calendar.HeaderCell
        typealias TableCell = DayPage.Calendar.TableCell
        
        // MARK: - Properties
        
        var collectionView: UICollectionView?
        
        var sections: [Section] = []
        
        lazy var dataSource: UICollectionViewDiffableDataSource<Section, ViewState> = {
            guard let collectionView = collectionView else {
                fatalError("Calendar CollectionView should be available")
            }
            let dataSource = UICollectionViewDiffableDataSource<Section, ViewState>(
                collectionView: collectionView,
                cellProvider: { (collectionView, indexPath, itemViewState) -> UICollectionViewCell? in
                    switch self.sections[indexPath.section].type {
                    case .header:
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell
                        cell?.viewState = itemViewState
                        return cell
                    case .table:
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as? TableCell
                        cell?.viewState = itemViewState
                        return cell
                    }
            })
            return dataSource
        }()
        
        // MARK: - Public Methods
        
        func update(_ sections: [Section], animated: Bool) {
            self.sections = sections
            updateData(animated: animated)
        }
        
        // MARK: - Private Methods
        
        private func updateData(animated: Bool) {
            var snapshot = NSDiffableDataSourceSnapshot<Section, ViewState>()
            snapshot.appendSections(sections)
            sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
            dataSource.apply(snapshot, animatingDifferences: animated)
        }
        
    }
    
}
