import UIKit

protocol DayPageViewProtocol: UICollectionView {
    
    /// Holds the ViewState of the `DayPage`
    var viewState: DayPage.ViewState? { get set }
    
}

extension DayPage {
    
    final class View: UICollectionView, DayPageViewProtocol {
        
        enum Constants {
            
            static let minimumLineSpacing: CGFloat = 0.0
            
        }
        
        // MARK: - Properties
        
        var viewState: ViewState? {
            didSet {
                reloadData()
            }
        }
        
        // MARK: - Init
        
        init() {
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = Constants.minimumLineSpacing
            
            super.init(frame: .zero, collectionViewLayout: layout)
            setupView()
            configureDataSource()
            configureTableView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        
        private func setupView() {
            backgroundColor = .white
            isPagingEnabled = true
            showsVerticalScrollIndicator = false
            showsHorizontalScrollIndicator = false
        }
        
        private func configureDataSource() {
            dataSource = self
        }
        
        private func configureTableView() {
            register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
        }
        
    }
    
}

// MARK: - CollectionView DataSource

extension DayPage.View: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 88
    }
    
    // TODO: Change force unwrapping "as!" with guard, check for sollution in PaulHadson, RW tutorial or our project
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.ViewCell.identifier, for: indexPath) as! DayPage.ViewCell
        let title = "Day: \(indexPath.row)"
        let date = "\(indexPath.row)"
        let subtitle = "\(indexPath.row)TH DAY, 337 LEFT, WEEK 4"
        let dateViewState = DayPage.DateView.ViewState(
            title: title,
            date: date,
            subtitle: subtitle
        )
        cell.renderDate(viewState: dateViewState)
        
        guard let viewState = viewState else { return cell }
        cell.viewState = DayPage.ViewCell.ViewState(
            calendarState: viewState.calendarState
        )
        
        return cell
    }
    
}

// MARK: - CollectionView Delegate

extension DayPage.View: UICollectionViewDelegate {
    
}

// MARK: - CollectionView DelegateFlowLayout

extension DayPage.View: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
}
