import UIKit

// TODO: - Is needed only for tests, which are not created yet.
protocol CalendarCollectionViewDataSourceProtocol {
    
}

extension DayPage.Calendar {
    
    final class CollectionViewDataSource: CalendarCollectionViewDataSourceProtocol {
        
        // MARK: - Properties
        
        var collectionView: UICollectionView?
        
        var sections: [DayPage.Calendar.Section] = []
        
        lazy var dataSource: UICollectionViewDiffableDataSource<DayPage.Calendar.Section, DayPage.Calendar.CollectionViewCell.ViewState> = {
            
            guard let collectionView = collectionView else {
                fatalError("Calendar CollectionView should be available")
            }
            
            let dataSource = UICollectionViewDiffableDataSource<DayPage.Calendar.Section, DayPage.Calendar.CollectionViewCell.ViewState>(
                collectionView: collectionView,
                cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
                    let section = self.sections[indexPath.section]
                    switch section.type {
                    case .header:
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.Calendar.HeaderCell.identifier, for: indexPath) as? DayPage.Calendar.HeaderCell
                        cell?.viewState = item
                        return cell
                        
                    case .table:
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.Calendar.TableCell.identifier, for: indexPath) as? DayPage.Calendar.TableCell
                        cell?.viewState = item
                        return cell
                    }

            })
            
            return dataSource
        }()
        
        // MARK: - Public Methods
        
        func update(_ sections: [DayPage.Calendar.Section], animated: Bool) {
            self.sections = sections
            updateData(animated: animated)
        }
        
        // MARK: - Private Methods
        
        private func updateData(animated: Bool) {
            var snapshot = NSDiffableDataSourceSnapshot<DayPage.Calendar.Section, DayPage.Calendar.CollectionViewCell.ViewState>()
            snapshot.appendSections(sections)
            sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
            dataSource.apply(snapshot, animatingDifferences: animated)
        }
        
    }
    
}
