import UIKit

extension DayPage.Calendar {
    
    // TODO: Check all classes and make sure all relevant classes are final
    // Learn differences about final and not final classes
    final class CollectionContainerView: UIView {
        
        // MARK: - Properties
        
        var collectionViewDataSource: CollectionViewDataSource
        
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
        
        private lazy var collectionView: UICollectionView = {
            var collectionView = UICollectionView(
                frame: .zero,
                collectionViewLayout: UICollectionViewLayout()
            )
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
        
        // MARK: - Public Methods
        
        static func create(dataSource: CollectionViewDataSource) -> CollectionContainerView {
            let view = CollectionContainerView(dataSource: dataSource)
            view.setup()
            return view
        }
        
        func updateLayout(animated: Bool) {
            collectionView.setCollectionViewLayout(createCompositionalLayout(), animated: animated)
            collectionView.collectionViewLayout.invalidateLayout()
        }
        
        // MARK: - Private Methods
        
        private func setup() {
            collectionViewDataSource.collectionView = collectionView
            addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.topAnchor.constraint(equalTo: topAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
            collectionView.register(MonthDayCell.self, forCellWithReuseIdentifier: MonthDayCell.identifier)
            collectionView.register(WeekDayCell.self, forCellWithReuseIdentifier: WeekDayCell.identifier)
        }
        
        
        
        private func createCompositionalLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                let section = self.sections[sectionIndex]
                switch section.type {
                case "WeekDays":
                    return self.createWeekDaysSection()
    
                default:
                    return self.createMonthDaysSection()
                }
            }
            return layout
        }
        
        private func createWeekDaysSection() -> NSCollectionLayoutSection {
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
        
        private func createMonthDaysSection() -> NSCollectionLayoutSection {
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
        
        
        
    }
    
}
