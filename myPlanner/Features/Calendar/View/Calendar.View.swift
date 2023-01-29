import UIKit

extension Calendar {
    
    class View: UIView {
        
        // MARK: - SubViews
        private lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 0
            var collectionView = UICollectionView(frame: frame, collectionViewLayout: layout).autolayout()
            collectionView.backgroundColor = .white
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
//            collectionView.isScrollEnabled = false
            return collectionView
        }()
        
        // MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            setConstraints()
            
            collectionView.dataSource = self
            collectionView.delegate = self
            
            collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        private func setupViews() {
            backgroundColor = .white
            addSubview(collectionView)
        }
        
    }
    
}

// MARK: - SetConstraints
extension Calendar.View {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}

// MARK: - CollectionView DataSource
extension Calendar.View: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 49
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Calendar.Cell.identifier, for: indexPath) as! Calendar.Cell
        cell.label.text = "\(indexPath.row)"
        return cell
    }
    
}

// MARK: - CollectionView Delegate
extension Calendar.View: UICollectionViewDelegate {
    
}

// MARK: - CollectionView DelegateFlowLayout
extension Calendar.View: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print("🟢 frame width: \(frame.width)")
        print("🟢🟢 frame width/ 7: \(frame.width / 7)")
        
        return CGSize(width: frame.width / 7, height: frame.height / 7)
    }
}
