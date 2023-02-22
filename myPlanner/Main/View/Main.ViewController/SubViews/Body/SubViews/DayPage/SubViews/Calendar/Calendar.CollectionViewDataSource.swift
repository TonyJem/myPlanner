import UIKit

// TODO: - Is needed only for tests, which are not created yet.
protocol CalendarCollectionViewDataSourceProtocol {
    
}

extension DayPage.Calendar {
    
    final class CollectionViewDataSource: CalendarCollectionViewDataSourceProtocol {
        
        // MARK: - Properties
        
        var collectionView: UICollectionView?
        
        var sections: [DayPage.Calendar.Section] = []
        
        lazy var dataSource: UICollectionViewDiffableDataSource<DayPage.Calendar.Section, CalendarSectionItem> = {
            
            guard let collectionView = collectionView else {
                fatalError("Calendar CollectionView should be available")
            }
            
            let dataSource = UICollectionViewDiffableDataSource<DayPage.Calendar.Section, CalendarSectionItem>(
                collectionView: collectionView,
                cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
                    let section = self.sections[indexPath.section]
                    switch section.type {
                    case .weekDays:
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.Calendar.WeekDayCell.identifier, for: indexPath) as? DayPage.Calendar.WeekDayCell
                        
                        cell?.setLabel(text: item.title)
                        
                        return cell
                        
                    case .monthDays:
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.Calendar.MonthDayCell.identifier, for: indexPath) as? DayPage.Calendar.MonthDayCell
                        
                        cell?.setLabel(text: item.title)
                        
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
            var snapshot = NSDiffableDataSourceSnapshot<DayPage.Calendar.Section, CalendarSectionItem>()
            snapshot.appendSections(sections)
            sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
            dataSource.apply(snapshot, animatingDifferences: animated)
        }
        
    }
    
}
