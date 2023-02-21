import UIKit

// TODO: - Is needed only for tests, which are not created yet.
protocol CalendarCollectionViewDataSourceProtocol {
    
}

extension DayPage.Calendar {
    
    final class CollectionViewDataSource: CalendarCollectionViewDataSourceProtocol {
        
        // MARK: - Properties
        
        var collectionView: UICollectionView?
        
    }
    
}
