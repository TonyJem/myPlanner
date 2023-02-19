import UIKit

extension DayPage {
    
    final class View: UICollectionView {
        
        enum Constants {
            
            static let minimumLineSpacing: CGFloat = 0.0
            
        }
        
        // MARK: - Init
        
        init() {
            
            let layout = AutoInvalidatingLayout()
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
        return 888
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.ViewCell.identifier, for: indexPath) as! DayPage.ViewCell
        let title = "Day: \(indexPath.row)"
        let date = "\(indexPath.row)"
        let subtitle = "\(indexPath.row)TH DAY, 337 LEFT, WEEK 4"
        let viewState = DayPage.Date.ViewState(
            title: title,
            date: date,
            subtitle: subtitle
        )
        cell.renderDate(viewState: viewState)
        return cell
    }
    
}
