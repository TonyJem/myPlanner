import UIKit

extension DayPage.Calendar {
    
    // TODO: Check all classes and make sure all relevant classes are final
    // Learn differences about final and not final classes
    final class CollectionContainerView: UIView {
        
        // MARK: - Properties
        
        var collectionViewDataSource: CollectionViewDataSource
        
        // MARK: - SubViews
        
        private lazy var collectionView: UICollectionView = {
            var collectionView = UICollectionView(
                frame: .zero,
                collectionViewLayout: UICollectionViewLayout()
            )
            collectionView.contentInsetAdjustmentBehavior = .always
            return collectionView
        }()
        
        private lazy var layout = {
            
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
        
        static func create(dataSource: CollectionViewDataSource) -> CollectionContainerView {
            let view = CollectionContainerView(dataSource: dataSource)
            view.setup()
            return view
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
        
        
        
    }
    
}
