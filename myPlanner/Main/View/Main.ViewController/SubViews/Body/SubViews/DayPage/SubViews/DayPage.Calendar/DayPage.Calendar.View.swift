import UIKit

protocol CalendarViewProtocol: UICollectionView {
    
    /// Holds the ViewState of the `DayPage.Calendar`
    var viewState: DayPage.Calendar.ViewState? { get set }
    
}

extension DayPage.Calendar {
    
    final class CollectionView: UICollectionView {
        
        enum Constants {
            
            static let minimumLineSpacing: CGFloat = 0.0
            
        }
        
        // MARK: - Properties
        
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        
        // MARK: - Init
        
        init() {
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = Constants.minimumLineSpacing
            
            super.init(frame: .zero, collectionViewLayout: layout)
            setupView()
            configureCollectionView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        // MARK: - Private Methods
        
        private func setupView() {
            backgroundColor = .green
            
            isPagingEnabled = true
            showsVerticalScrollIndicator = false
            showsHorizontalScrollIndicator = false
        }
        
        private func configureCollectionView() {
            dataSource = self
            delegate = self
            register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
        }
        
    }
    
}


// MARK: - CalendarViewProtocol

extension DayPage.Calendar.CollectionView: CalendarViewProtocol {
    
    private func render(viewState: DayPage.Calendar.ViewState?) {
        
    }
    
}
