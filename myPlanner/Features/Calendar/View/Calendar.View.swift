import UIKit

extension Calendar {
    
    class View: UIView {
        
        enum Constants {
            
            static let weekDaysRowHeightMultiplier: CGFloat = 1/7
            static let numberOfRows: CGFloat = 7
            static let numberOfCollumns: CGFloat = 7
            
        }
        
        private let weekDayViewStates: [CollectionViewCell.ViewState] = [
            CollectionViewCell.ViewState(text: "Mon", type: .weekDay),
            CollectionViewCell.ViewState(text: "Tue", type: .weekDay),
            CollectionViewCell.ViewState(text: "Wed", type: .weekDay),
            CollectionViewCell.ViewState(text: "Thu", type: .weekDay),
            CollectionViewCell.ViewState(text: "Fri", type: .weekDay),
            CollectionViewCell.ViewState(text: "Sat", type: .weekDay),
            CollectionViewCell.ViewState(text: "Sun", type: .weekDay)
        ]
        
        private let dateViewStates: [CollectionViewCell.ViewState] = [
            CollectionViewCell.ViewState(text: "26"),
            CollectionViewCell.ViewState(text: "27"),
            CollectionViewCell.ViewState(text: "28"),
            CollectionViewCell.ViewState(text: "29"),
            CollectionViewCell.ViewState(text: "30"),
            CollectionViewCell.ViewState(text: "31"),
            CollectionViewCell.ViewState(text: "1"),
            CollectionViewCell.ViewState(text: "2"),
            CollectionViewCell.ViewState(text: "3"),
            CollectionViewCell.ViewState(text: "4"),
            CollectionViewCell.ViewState(text: "5"),
            CollectionViewCell.ViewState(text: "6"),
            CollectionViewCell.ViewState(text: "7"),
            CollectionViewCell.ViewState(text: "8"),
            CollectionViewCell.ViewState(text: "9", isSelected: true),
            CollectionViewCell.ViewState(text: "10"),
            CollectionViewCell.ViewState(text: "11"),
            CollectionViewCell.ViewState(text: "12"),
            CollectionViewCell.ViewState(text: "13"),
            CollectionViewCell.ViewState(text: "14"),
            CollectionViewCell.ViewState(text: "15"),
            CollectionViewCell.ViewState(text: "16"),
            CollectionViewCell.ViewState(text: "17"),
            CollectionViewCell.ViewState(text: "18"),
            CollectionViewCell.ViewState(text: "19"),
            CollectionViewCell.ViewState(text: "20"),
            CollectionViewCell.ViewState(text: "21"),
            CollectionViewCell.ViewState(text: "22", isToday: true),
            CollectionViewCell.ViewState(text: "23"),
            CollectionViewCell.ViewState(text: "24"),
            CollectionViewCell.ViewState(text: "25"),
            CollectionViewCell.ViewState(text: "26"),
            CollectionViewCell.ViewState(text: "27"),
            CollectionViewCell.ViewState(text: "28"),
            CollectionViewCell.ViewState(text: "29"),
            CollectionViewCell.ViewState(text: "30"),
            CollectionViewCell.ViewState(text: "31"),
            CollectionViewCell.ViewState(text: "1"),
            CollectionViewCell.ViewState(text: "2"),
            CollectionViewCell.ViewState(text: "3"),
            CollectionViewCell.ViewState(text: "4"),
            CollectionViewCell.ViewState(text: "5")
        ]
        
        // MARK: - SubViews
        
        private lazy var weekDays = createCollectionView()
        private lazy var dates = createCollectionView()
        
        // MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            setConstraints()
            
            weekDays.dataSource = self
            weekDays.delegate = self
            weekDays.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
            
            dates.dataSource = self
            dates.delegate = self
            dates.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        private func setupViews() {
            backgroundColor = .white
            addSubview(weekDays)
            addSubview(dates)
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
            
            dates.leadingAnchor.constraint(equalTo: leadingAnchor),
            dates.topAnchor.constraint(equalTo: weekDays.bottomAnchor, constant: -.spacingXS),
            dates.trailingAnchor.constraint(equalTo: trailingAnchor),
            dates.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}

// MARK: - CollectionView DataSource
extension Calendar.View: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.weekDays {
            return weekDayViewStates.count
        } else {
            return dateViewStates.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Calendar.Cell.identifier, for: indexPath) as! Calendar.Cell
        
        if collectionView == self.weekDays {
            cell.viewState = weekDayViewStates[indexPath.row]
        } else {
            cell.viewState = dateViewStates[indexPath.row]
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
