import UIKit

extension DayPage {
    
    final class NewView: UICollectionView {
        
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
extension DayPage.NewView: UICollectionViewDataSource {
    
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
extension DayPage.NewView: UICollectionViewDelegate {
    
}

// MARK: - CollectionView DelegateFlowLayout
extension DayPage.NewView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
}

// TODO: - OLD View. Need to remove it! -

extension DayPage {
    
    class View: UIView {
        
        // MARK: - SubViews
        
        private lazy var subView = UIView().autolayout()
        
        // MARK: - Init
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
            addSubViews()
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        
        private func setupView() {
            backgroundColor = .white
        }
        
        private func addSubViews() {
            addSubview(subView)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                subView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacingL),
                subView.topAnchor.constraint(equalTo: topAnchor, constant: .spacingL),
                subView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacingL),
                subView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.spacingL)
                
            ])
        }
        
    }
    
}

