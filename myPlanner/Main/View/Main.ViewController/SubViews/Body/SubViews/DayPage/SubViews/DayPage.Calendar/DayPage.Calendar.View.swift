import UIKit

struct MyItem: Hashable {
    var title: String
}

struct MySection: Hashable {
    
    let type: String
    
    var items: [MyItem]
    
}

extension DayPage.Calendar {
    
    final class View: UIView {
        
        // MARK: - Properties
        
        var collectionView: UICollectionView!
        
        var dataSource: UICollectionViewDiffableDataSource<MySection, MyItem>?
        
        var sections: [MySection] = [
        
            MySection(
                type: "WeekDays",
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
                type: "MonthDays",
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
        
        // MARK: - SubViews
        
        // MARK: - Init
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setupCollectionView()
            createDataSource()
            reloadData()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        
        private func setupView() {
        }
        
        private func setupCollectionView() {
            collectionView = UICollectionView(
                frame: self.bounds,
                collectionViewLayout: createCompositionalLayout()
            )
            collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            collectionView.isScrollEnabled = false
            
            self.addSubview(collectionView)
            
            collectionView.register(MonthDayCell.self, forCellWithReuseIdentifier: MonthDayCell.identifier)
            collectionView.register(WeekDayCell.self, forCellWithReuseIdentifier: WeekDayCell.identifier)
            
        }
        
        private func createCompositionalLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                let section = self.sections[sectionIndex]
                switch section.type {
                default:
                    return self.createMonthDaysSection()
                }
            }
            return layout
        }
        
        
        // section -> group -> items -> size
        private func createSection() -> NSCollectionLayoutSection {
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
        
        private func createDataSource() {
            dataSource = UICollectionViewDiffableDataSource<MySection, MyItem>(
                collectionView: collectionView,
                cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
                    
                    switch self.sections[indexPath.section].type {
                    case "WeekDays":
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.Calendar.WeekDayCell.identifier, for: indexPath) as? DayPage.Calendar.WeekDayCell
                        
                        cell?.setLabel(text: item.title)
                        return cell
                        
                    default:
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.Calendar.MonthDayCell.identifier, for: indexPath) as? DayPage.Calendar.MonthDayCell
                        
                        cell?.setLabel(text: item.title)
                        return cell
                    }

            })
        }
        
        private func reloadData() {
            var snapshot = NSDiffableDataSourceSnapshot<MySection, MyItem>()
            snapshot.appendSections(sections)
            
            for section in sections {
                snapshot.appendItems(section.items, toSection: section)
            }
            dataSource?.apply(snapshot)
        }
        
    }
    
}
