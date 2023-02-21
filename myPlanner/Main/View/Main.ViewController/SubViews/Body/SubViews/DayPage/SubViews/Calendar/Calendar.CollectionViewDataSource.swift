import UIKit

// TODO: - Is needed only for tests, which are not created yet.
protocol CalendarCollectionViewDataSourceProtocol {
    
}

extension DayPage.Calendar {
    
    final class CollectionViewDataSource: CalendarCollectionViewDataSourceProtocol {
        
        // MARK: - Properties
        
        var collectionView: UICollectionView?
        
        var sections: [CalendarSection] = []
        
        lazy var dataSource: UICollectionViewDiffableDataSource<CalendarSection, CalendarItem> = {
            
            guard let collectionView = collectionView else {
                fatalError("Calendar CollectionView should be available")
            }
            
            let dataSource = UICollectionViewDiffableDataSource<CalendarSection, CalendarItem>(
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
        
        func update(_ sections: [CalendarSection], animated: Bool) {
            self.sections = sections
            updateData(animated: animated)
        }
        
        // MARK: - Private Methods
        
        private func updateData(animated: Bool) {
            var snapshot = NSDiffableDataSourceSnapshot<CalendarSection, CalendarItem>()
            snapshot.appendSections(sections)
            sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
            dataSource.apply(snapshot, animatingDifferences: animated)
        }
        
    }
    
}
