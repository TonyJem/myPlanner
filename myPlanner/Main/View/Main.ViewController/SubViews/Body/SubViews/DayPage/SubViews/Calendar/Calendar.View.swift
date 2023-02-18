import UIKit

extension DayPage.Calendar {
    
    class View: UIView {
        
        enum Constants {
            
            static let weekDaysRowHeightMultiplier: CGFloat = 1/7
            static let numberOfRows: CGFloat = 7
            static let numberOfCollumns: CGFloat = 7
            
        }
        
        private let weekDayViewStates: [ViewCell.ViewState] = [
            ViewCell.ViewState(text: "Mon", cellType: .weekDay),
            ViewCell.ViewState(text: "Tue", cellType: .weekDay),
            ViewCell.ViewState(text: "Wed", cellType: .weekDay),
            ViewCell.ViewState(text: "Thu", cellType: .weekDay),
            ViewCell.ViewState(text: "Fri", cellType: .weekDay),
            ViewCell.ViewState(text: "Sat", cellType: .weekDay),
            ViewCell.ViewState(text: "Sun", cellType: .weekDay)
        ]
        
        private let dateViewStates: [ViewCell.ViewState] = [
            ViewCell.ViewState(text: "26", monthType: .previousMonth),
            ViewCell.ViewState(text: "27", monthType: .previousMonth),
            ViewCell.ViewState(text: "28", monthType: .previousMonth),
            ViewCell.ViewState(text: "29", monthType: .previousMonth),
            ViewCell.ViewState(text: "30", monthType: .previousMonth),
            ViewCell.ViewState(text: "31", monthType: .previousMonth),
            ViewCell.ViewState(text: "1"),
            ViewCell.ViewState(text: "2"),
            ViewCell.ViewState(text: "3"),
            ViewCell.ViewState(text: "4"),
            ViewCell.ViewState(text: "5"),
            ViewCell.ViewState(text: "6"),
            ViewCell.ViewState(text: "7"),
            ViewCell.ViewState(text: "8"),
            ViewCell.ViewState(text: "9", isSelected: true),
            ViewCell.ViewState(text: "10"),
            ViewCell.ViewState(text: "11"),
            ViewCell.ViewState(text: "12"),
            ViewCell.ViewState(text: "13"),
            ViewCell.ViewState(text: "14"),
            ViewCell.ViewState(text: "15"),
            ViewCell.ViewState(text: "16"),
            ViewCell.ViewState(text: "17"),
            ViewCell.ViewState(text: "18"),
            ViewCell.ViewState(text: "19"),
            ViewCell.ViewState(text: "20"),
            ViewCell.ViewState(text: "21"),
            ViewCell.ViewState(text: "22", isToday: true),
            ViewCell.ViewState(text: "23"),
            ViewCell.ViewState(text: "24"),
            ViewCell.ViewState(text: "25"),
            ViewCell.ViewState(text: "26"),
            ViewCell.ViewState(text: "27"),
            ViewCell.ViewState(text: "28"),
            ViewCell.ViewState(text: "29"),
            ViewCell.ViewState(text: "30"),
            ViewCell.ViewState(text: "31"),
            ViewCell.ViewState(text: "1", monthType: .nextMonth),
            ViewCell.ViewState(text: "2", monthType: .nextMonth),
            ViewCell.ViewState(text: "3", monthType: .nextMonth),
            ViewCell.ViewState(text: "4", monthType: .nextMonth),
            ViewCell.ViewState(text: "5", monthType: .nextMonth)
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
            weekDays.register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
            
            dates.dataSource = self
            dates.delegate = self
            dates.register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
            
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
extension DayPage.Calendar.View {
    
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
extension DayPage.Calendar.View: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.weekDays {
            return weekDayViewStates.count
        } else {
            return dateViewStates.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayPage.Calendar.ViewCell.identifier, for: indexPath) as! DayPage.Calendar.ViewCell
        
        if collectionView == self.weekDays {
            cell.viewState = weekDayViewStates[indexPath.row]
        } else {
            cell.viewState = dateViewStates[indexPath.row]
        }
        
        return cell
    }
    
}

// MARK: - CollectionView Delegate
extension DayPage.Calendar.View: UICollectionViewDelegate {
    
}

// MARK: - CollectionView DelegateFlowLayout
extension DayPage.Calendar.View: UICollectionViewDelegateFlowLayout {
    
    // Returns Item size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: frame.width / Constants.numberOfCollumns,
            height: frame.height / Constants.numberOfRows
        )
    }
    
}
