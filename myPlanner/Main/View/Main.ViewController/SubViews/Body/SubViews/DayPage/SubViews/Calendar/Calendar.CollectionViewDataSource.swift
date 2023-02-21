import UIKit

// TODO: - Is needed only for tests, which are not created yet.
protocol CalendarCollectionViewDataSourceProtocol {
    
}

struct MyItem: Hashable {
    var title: String
}

struct MySection: Hashable {
    
    let type: DayPage.Calendar.SectionType
    
    var items: [MyItem]
    
}

extension DayPage.Calendar {
    
    final class CollectionViewDataSource: CalendarCollectionViewDataSourceProtocol {
        
        // MARK: - Properties
        
        var collectionView: UICollectionView?

        var sections: [MySection] = [
        
            MySection(
                type: .weekDays,
                items: [
                MyItem(title: "Mon"),
                MyItem(title: "Tue"),
                MyItem(title: "Wed"),
                MyItem(title: "Thu"),
                MyItem(title: "Fri"),
                MyItem(title: "Sat"),
                MyItem(title: "Sun")
            ]),
            
            MySection(
                type: .monthDays,
                items: [
                MyItem(title: "1"),
                MyItem(title: "2"),
                MyItem(title: "3"),
                MyItem(title: "4"),
                MyItem(title: "5"),
                MyItem(title: "6"),
                MyItem(title: "7"),
                MyItem(title: "8"),
                MyItem(title: "9"),
                MyItem(title: "10"),
                MyItem(title: "11"),
                MyItem(title: "12"),
                MyItem(title: "13"),
                MyItem(title: "14"),
                MyItem(title: "15"),
                MyItem(title: "16"),
                MyItem(title: "17"),
                MyItem(title: "18"),
                MyItem(title: "19"),
                MyItem(title: "20"),
                MyItem(title: "21"),
                MyItem(title: "22"),
                MyItem(title: "23"),
                MyItem(title: "24"),
                MyItem(title: "25"),
                MyItem(title: "26"),
                MyItem(title: "27"),
                MyItem(title: "28"),
                MyItem(title: "29"),
                MyItem(title: "30"),
                MyItem(title: "31"),
                MyItem(title: "32"),
                MyItem(title: "33"),
                MyItem(title: "34"),
                MyItem(title: "35"),
                MyItem(title: "36"),
                MyItem(title: "37"),
                MyItem(title: "38"),
                MyItem(title: "39"),
                MyItem(title: "40"),
                MyItem(title: "41"),
                MyItem(title: "42")
            ])
        
        ]
        
        lazy var dataSource: UICollectionViewDiffableDataSource<MySection, MyItem> = {
            
            guard let collectionView = collectionView else {
                fatalError("Calendar CollectionView should be available")
            }
            
            let dataSource = UICollectionViewDiffableDataSource<MySection, MyItem>(
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
            var snapshot = NSDiffableDataSourceSnapshot<MySection, MyItem>()
            snapshot.appendSections(sections)
            
            for section in sections {
                snapshot.appendItems(section.items, toSection: section)
            }
            
            dataSource.apply(snapshot, animatingDifferences: animated)
        }
        
    }
    
}
