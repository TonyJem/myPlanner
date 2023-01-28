import UIKit

extension Day {
    
    final class View: UICollectionView {
        
        enum Constants {
            
            static let minimumLineSpacing: CGFloat = 0.0
            
        }
        
        // MARK: - Init
        init() {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = Constants.minimumLineSpacing
            super.init(frame: .zero, collectionViewLayout: layout)
            
            backgroundColor = .white
            isPagingEnabled = true
            showsVerticalScrollIndicator = false
            showsHorizontalScrollIndicator = false
            
            dataSource = self
            delegate = self
            
            register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
}

// MARK: - CollectionView DataSource
extension Day.View: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 888
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Day.ViewCell.identifier, for: indexPath) as! Day.ViewCell
        
        let title = "Day: \(indexPath.row)"
        let date = "\(indexPath.row)"
        let subtitle = "\(indexPath.row)TH DAY, 337 LEFT, WEEK 4"
        
        let viewState = DateModul.ViewState(
            title: title,
            date: date,
            subtitle: subtitle
        )
        
        cell.renderDate(viewState: viewState)
        
        return cell
    }
}

// MARK: - CollectionView Delegate
extension Day.View: UICollectionViewDelegate {
    
}

// MARK: - CollectionView DelegateFlowLayout
extension Day.View: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
}
