import UIKit

extension DayPage.Calendar {
    
    final class View: UIView {
        
        // MARK: - Properties
        
        var collectionView: UICollectionView!
        
        var sections: [MySection] = [
        
            MySection(
                type: "DayNames",
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
            
            self.addSubview(collectionView)
            
            collectionView.register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
            
            collectionView.dataSource = self
            collectionView.delegate = self
            
        }
        
        private func createCompositionalLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                let section = self.sections[sectionIndex]
                switch section.type {
                default:
                    return self.createSection()
                }
            }
            return layout
        }
        
        
        // section -> group -> items -> size
        private func createSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/7),
                heightDimension: .fractionalWidth(1/7)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(1.0)
            )
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            return section
        }
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension DayPage.Calendar.View: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.Calendar.ViewCell.identifier, for: indexPath) as! DayPage.Calendar.ViewCell
        
        let section = sections[indexPath.section]
        let item = section.items[indexPath.item]
        
        cell.setLabel(text: item.title)
        return cell
    }
    
}

extension DayPage.Calendar.View: UICollectionViewDelegate {
    
}
