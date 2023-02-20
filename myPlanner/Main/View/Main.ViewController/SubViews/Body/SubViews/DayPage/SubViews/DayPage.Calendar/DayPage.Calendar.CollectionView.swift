import UIKit

protocol CalendarCollectionViewProtocol: UICollectionView {
    
    /// Holds the ViewState of the `DayPage.Calendar`
    var viewState: DayPage.Calendar.ViewState? { get set }
    
}

extension DayPage.Calendar {
    
    final class CollectionView: UICollectionView {
        
        enum Constants {
            
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
            layout.minimumLineSpacing = .separatorHeight
            layout.minimumInteritemSpacing = .separatorHeight
            
            super.init(frame: .zero, collectionViewLayout: layout)
            setupView()
            configureCollectionView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        // MARK: - Private Methods
        
        private func setupView() {
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


// MARK: - CalendarCollectionViewProtocol

extension DayPage.Calendar.CollectionView: CalendarCollectionViewProtocol {
    
    private func render(viewState: DayPage.Calendar.ViewState?) {
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension DayPage.Calendar.CollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 49
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.Calendar.ViewCell.identifier, for: indexPath) as! DayPage.Calendar.ViewCell
        cell.backgroundColor = .systemOrange
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension DayPage.Calendar.CollectionView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DayPage.Calendar.CollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/7-1, height: frame.height/7-1)
    }
    
}
