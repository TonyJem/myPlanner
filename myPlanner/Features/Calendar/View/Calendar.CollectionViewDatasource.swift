import UIKit

protocol CalendarCollectionViewDatasource {
    
}

extension Calendar {

    class CollectionViewDatasource: CalendarCollectionViewDatasource {
        
        enum Section {
            case main
        }

        var itemViewStates: [Calendar.ItemViewState] = [
            Calendar.ItemViewState(text: "0"),
            Calendar.ItemViewState(text: "1"),
            Calendar.ItemViewState(text: "2"),
            Calendar.ItemViewState(text: "3"),
            Calendar.ItemViewState(text: "4"),
            Calendar.ItemViewState(text: "5"),
            Calendar.ItemViewState(text: "6"),
            Calendar.ItemViewState(text: "7"),
            Calendar.ItemViewState(text: "8"),
            Calendar.ItemViewState(text: "9"),
            Calendar.ItemViewState(text: "10"),
            Calendar.ItemViewState(text: "11"),
            Calendar.ItemViewState(text: "12"),
            Calendar.ItemViewState(text: "13"),
            Calendar.ItemViewState(text: "14"),
            Calendar.ItemViewState(text: "15"),
            Calendar.ItemViewState(text: "16"),
            Calendar.ItemViewState(text: "17"),
            Calendar.ItemViewState(text: "18"),
            Calendar.ItemViewState(text: "19"),
            Calendar.ItemViewState(text: "20"),
            Calendar.ItemViewState(text: "21"),
            Calendar.ItemViewState(text: "22"),
            Calendar.ItemViewState(text: "23"),
            Calendar.ItemViewState(text: "24"),
            Calendar.ItemViewState(text: "25"),
            Calendar.ItemViewState(text: "26"),
            Calendar.ItemViewState(text: "27"),
            Calendar.ItemViewState(text: "28"),
            Calendar.ItemViewState(text: "29"),
            Calendar.ItemViewState(text: "30"),
            Calendar.ItemViewState(text: "31"),
            Calendar.ItemViewState(text: "32"),
            Calendar.ItemViewState(text: "33"),
            Calendar.ItemViewState(text: "34"),
            Calendar.ItemViewState(text: "35"),
            Calendar.ItemViewState(text: "36"),
            Calendar.ItemViewState(text: "37"),
            Calendar.ItemViewState(text: "38"),
            Calendar.ItemViewState(text: "39"),
            Calendar.ItemViewState(text: "40"),
            Calendar.ItemViewState(text: "41"),
            Calendar.ItemViewState(text: "42"),
            Calendar.ItemViewState(text: "43"),
            Calendar.ItemViewState(text: "44"),
            Calendar.ItemViewState(text: "45"),
            Calendar.ItemViewState(text: "46"),
            Calendar.ItemViewState(text: "47"),
            Calendar.ItemViewState(text: "48")
        ]

        var collectionView: UICollectionView?

        lazy var dataSourse: UICollectionViewDiffableDataSource<Section, Calendar.ItemViewState> = {
            guard let collectionView = collectionView else {
                fatalError("CollectionView should be available")
            }
            
            let gridCellRegistration = self.gridCellRegistration()
            
            let dataSource = UICollectionViewDiffableDataSource<Section, Calendar.ItemViewState>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, item: Calendar.ItemViewState) -> UICollectionViewCell? in
                return collectionView.dequeueConfiguredReusableCell(using: gridCellRegistration, for: indexPath, item: item)
            }
           
            return dataSourse
        }()
        
        public func update(itemViewStates: [Calendar.ItemViewState], animated: Bool) {
            self.itemViewStates = itemViewStates
            
        }
        
        private func updateData(animated: Bool) {
            var snapshot = NSDiffableDataSourceSnapshot<Section, Calendar.ItemViewState>()
            snapshot.appendSections([.main])
            snapshot.appendItems(itemViewStates)
            dataSourse.apply(snapshot, animatingDifferences: animated)
        }
        
        private func gridCellRegistration() -> UICollectionView.CellRegistration<Calendar.GridCell, Calendar.ItemViewState> {
            return UICollectionView.CellRegistration<Calendar.GridCell, Calendar.ItemViewState> { (cell, _, viewState) in
                cell.viewState = viewState
            }
        }

    }

}
