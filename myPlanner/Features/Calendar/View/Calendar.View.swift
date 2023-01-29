import UIKit

extension Calendar {
    
    class View: UIView {
        
        enum Constants {
            
            static let weekDaysRowHeightMultiplier: CGFloat = 1/7
            static let numberOfRows: CGFloat = 7
            static let numberOfCollumns: CGFloat = 7
            
//        TODO: need to remove monthDatesItemsCount and replace it with count of viewStates
            static let monthDatesItemsCount = 42
            
        }
        
        private let dayNames = [
            "Mon",
            "Tue",
            "Wed",
            "Thu",
            "Fri",
            "Sat",
            "Sun"
        ]
        
        // MARK: - SubViews
        
        private lazy var weekDays = createCollectionView()
        private lazy var monthDates = createCollectionView()
        
        // MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            setConstraints()
            
            weekDays.dataSource = self
            weekDays.delegate = self
            weekDays.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
            
            monthDates.dataSource = self
            monthDates.delegate = self
            monthDates.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        private func setupViews() {
            backgroundColor = .white
            addSubview(weekDays)
            addSubview(monthDates)
        }
        
        /// Creates default CollectionView.
        private func createCollectionView() -> UICollectionView {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = .zero
            layout.minimumInteritemSpacing = .zero
            
            let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout).autolayout()
            collectionView.backgroundColor = .white
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.isScrollEnabled = false
            return collectionView
        }
        
    }
    
}

// MARK: - SetConstraints
extension Calendar.View {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            weekDays.leadingAnchor.constraint(equalTo: leadingAnchor),
            weekDays.topAnchor.constraint(equalTo: topAnchor),
            weekDays.trailingAnchor.constraint(equalTo: trailingAnchor),
            weekDays.heightAnchor.constraint(
                equalTo: heightAnchor,
                multiplier: Constants.weekDaysRowHeightMultiplier
            ),
            
            monthDates.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthDates.topAnchor.constraint(equalTo: weekDays.bottomAnchor),
            monthDates.trailingAnchor.constraint(equalTo: trailingAnchor),
            monthDates.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}

// MARK: - CollectionView DataSource
extension Calendar.View: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.weekDays {
            return dayNames.count
        } else {
            return Constants.monthDatesItemsCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Calendar.Cell.identifier, for: indexPath) as! Calendar.Cell
        
        if collectionView == self.weekDays {
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
        return CGSize(
            width: frame.width / Constants.numberOfCollumns,
            height: frame.height / Constants.numberOfRows
        )
    }
    
}
