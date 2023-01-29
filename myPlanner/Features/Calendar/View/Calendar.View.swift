import UIKit

extension Calendar {
    
    class View: UIView {
        
        let dayNames = [
            "Mon",
            "Tue",
            "Wed",
            "Thu",
            "Fri",
            "Sat",
            "Sun"
        ]
        
        // MARK: - SubViews
        
        private lazy var days: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = .zero
            layout.minimumInteritemSpacing = .zero
            
            var collectionView = UICollectionView(frame: frame, collectionViewLayout: layout).autolayout()
            collectionView.backgroundColor = .white
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.isScrollEnabled = false
            return collectionView
        }()
        
        
        private lazy var numbers: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = .zero
            layout.minimumInteritemSpacing = .zero
            
            var collectionView = UICollectionView(frame: frame, collectionViewLayout: layout).autolayout()
            collectionView.backgroundColor = .white
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.isScrollEnabled = false
            return collectionView
        }()
        
        // MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            setConstraints()
            
            days.dataSource = self
            days.delegate = self
            days.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
            
            numbers.dataSource = self
            numbers.delegate = self
            numbers.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        private func setupViews() {
            backgroundColor = .white
            addSubview(days)
            addSubview(numbers)
        }
        
    }
    
}

// MARK: - SetConstraints
extension Calendar.View {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            days.leadingAnchor.constraint(equalTo: leadingAnchor),
            days.topAnchor.constraint(equalTo: topAnchor),
            days.trailingAnchor.constraint(equalTo: trailingAnchor),
            days.heightAnchor.constraint(equalToConstant: 30),
            
            numbers.leadingAnchor.constraint(equalTo: leadingAnchor),
            numbers.topAnchor.constraint(equalTo: days.bottomAnchor),
            numbers.trailingAnchor.constraint(equalTo: trailingAnchor),
            numbers.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}

// MARK: - CollectionView DataSource
extension Calendar.View: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case self.days:
            return dayNames.count
        case self.numbers:
            return 42
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Calendar.Cell.identifier, for: indexPath) as! Calendar.Cell
        
        if collectionView == self.days {
            cell.label.text = dayNames[indexPath.row]
        } else {
            cell.label.text = "\(indexPath.row)"
        }
        
        return cell
    }
    
}

// MARK: - CollectionView Delegate
extension Calendar.View: UICollectionViewDelegate {
    
}

// MARK: - CollectionView DelegateFlowLayout
extension Calendar.View: UICollectionViewDelegateFlowLayout {
    
    // Returns Item size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 7, height: frame.height / 7)
    }
    
}
