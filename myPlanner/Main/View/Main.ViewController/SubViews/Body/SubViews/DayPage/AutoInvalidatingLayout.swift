import UIKit

/// Smoothly refreshes the collection view layout and cell size after screen rotation
final class AutoInvalidatingLayout: UICollectionViewFlowLayout {
    
    // assign an initial estimatedItemSize by calling
    // updateEstimatedItemSize. prepare() will be called
    // the first time a collectionView is assigned
    override func prepare() {
        super.prepare()
        let bounds = collectionView?.bounds ?? .zero
        updateEstimatedItemSize(bounds: bounds)
    }
    
    // If the current collectionView bounds.size does
    // not match newBounds.size, update the
    // estimatedItemSize via updateEstimatedItemSize
    // and invalidate the layout
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        let oldSize = collectionView.bounds.size
        
        guard oldSize != newBounds.size else { return false }
        updateEstimatedItemSize(bounds: newBounds)
        return true
    }
    
    // MARK: - Private Methods
    
    // Update the estimatedItemSize for a given bounds
    private func updateEstimatedItemSize(bounds: CGRect) {
        estimatedItemSize = CGSize(
            width: widestCellWidth(bounds: bounds),
            height: highestCellHeight(bounds: bounds)
        )
    }
    
    /// Computes the width of a full width cell
    /// for a given bounds
    private func widestCellWidth(bounds: CGRect) -> CGFloat {
        if bounds.width < 0 { return 0 }
        else { return bounds.width }
    }
    
    /// Computes the height of a full height cell
    /// for a given bounds
    private func highestCellHeight(bounds: CGRect) -> CGFloat {
        if bounds.height < 0 { return 0 }
        else { return bounds.height }
    }
    
}
