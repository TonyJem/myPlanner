import UIKit

// TODO: - Is needed only for tests, which are not created yet.
protocol CalendarCollectionViewDataSourceProtocol {
    
}

struct CalendarItem: Hashable {
    let title: String
}

struct CalendarSection: Hashable {
    
    let type: DayPage.Calendar.SectionType
    let items: [CalendarItem]
    
}

extension DayPage.Calendar {
    
    final class CollectionViewDataSource: CalendarCollectionViewDataSourceProtocol {
        
        // MARK: - Properties
        
        var collectionView: UICollectionView?

        var sections: [CalendarSection] = [
        
            CalendarSection(
                type: .weekDays,
                items: [
                CalendarItem(title: "Mon"),
                CalendarItem(title: "Tue"),
                CalendarItem(title: "Wed"),
                CalendarItem(title: "Thu"),
                CalendarItem(title: "Fri"),
                CalendarItem(title: "Sat"),
                CalendarItem(title: "Sun")
            ]),
            
            CalendarSection(
                type: .monthDays,
                items: [
                CalendarItem(title: "1"),
                CalendarItem(title: "2"),
                CalendarItem(title: "3"),
                CalendarItem(title: "4"),
                CalendarItem(title: "5"),
                CalendarItem(title: "6"),
                CalendarItem(title: "7"),
                CalendarItem(title: "8"),
                CalendarItem(title: "9"),
                CalendarItem(title: "10"),
                CalendarItem(title: "11"),
                CalendarItem(title: "12"),
                CalendarItem(title: "13"),
                CalendarItem(title: "14"),
                CalendarItem(title: "15"),
                CalendarItem(title: "16"),
                CalendarItem(title: "17"),
                CalendarItem(title: "18"),
                CalendarItem(title: "19"),
                CalendarItem(title: "20"),
                CalendarItem(title: "21"),
                CalendarItem(title: "22"),
                CalendarItem(title: "23"),
                CalendarItem(title: "24"),
                CalendarItem(title: "25"),
                CalendarItem(title: "26"),
                CalendarItem(title: "27"),
                CalendarItem(title: "28"),
                CalendarItem(title: "29"),
                CalendarItem(title: "30"),
                CalendarItem(title: "31"),
                CalendarItem(title: "32"),
                CalendarItem(title: "33"),
                CalendarItem(title: "34"),
                CalendarItem(title: "35"),
                CalendarItem(title: "36"),
                CalendarItem(title: "37"),
                CalendarItem(title: "38"),
                CalendarItem(title: "39"),
                CalendarItem(title: "40"),
                CalendarItem(title: "41"),
                CalendarItem(title: "42")
            ])
        
        ]
        
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
        
        
        func update(animated: Bool) {
            var snapshot = NSDiffableDataSourceSnapshot<CalendarSection, CalendarItem>()
            snapshot.appendSections(sections)
            sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
            dataSource.apply(snapshot, animatingDifferences: animated)
        }
        
    }
    
}
