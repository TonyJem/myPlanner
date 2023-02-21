import UIKit

extension DayPage {
    
    final class ViewCell: UICollectionViewCell {
        
        enum Constants {
            
            static let dateViewWidthMultiplier: CGFloat = 0.25
            static let dateViewHeightMultiplier: CGFloat = 6/7
            
        }
        
        // MARK: - Properties
        
        var sections: [MySection] = [
        
            MySection(
                type: "WeekDays",
                items: [
                MyItem(title: "Mon"),
                MyItem(title: "Tue"),
                MyItem(title: "Wed"),
                MyItem(title: "Thu"),
                MyItem(title: "Fri"),
                MyItem(title: "Sat"),
                MyItem(title: "Sun")
            ]),
            
            MySection(
                type: "MonthDays",
                items: [
                MyItem(title: "1"),
                MyItem(title: "2"),
                MyItem(title: "3"),
                MyItem(title: "4"),
                MyItem(title: "5"),
                MyItem(title: "6"),
                MyItem(title: "7"),
                MyItem(title: "8"),
                MyItem(title: "9"),
                MyItem(title: "10"),
                MyItem(title: "11"),
                MyItem(title: "12"),
                MyItem(title: "13"),
                MyItem(title: "14"),
                MyItem(title: "15"),
                MyItem(title: "16"),
                MyItem(title: "17"),
                MyItem(title: "18"),
                MyItem(title: "19"),
                MyItem(title: "20"),
                MyItem(title: "21"),
                MyItem(title: "22"),
                MyItem(title: "23"),
                MyItem(title: "24"),
                MyItem(title: "25"),
                MyItem(title: "26"),
                MyItem(title: "27"),
                MyItem(title: "28"),
                MyItem(title: "29"),
                MyItem(title: "30"),
                MyItem(title: "31"),
                MyItem(title: "32"),
                MyItem(title: "33"),
                MyItem(title: "34"),
                MyItem(title: "35"),
                MyItem(title: "36"),
                MyItem(title: "37"),
                MyItem(title: "38"),
                MyItem(title: "39"),
                MyItem(title: "40"),
                MyItem(title: "41"),
                MyItem(title: "42")
            ])
        
        ]
        
        static let identifier = String(describing: ViewCell.self)
        
        var viewState: ViewState? {
            didSet {
                print("🟢 Will render(viewState: viewState) in ViewCell")
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var dateView: DayPage.DateView.View = {
            let view = DayPage.DateView.View().autolayout()
            return view
        }()
        
        private lazy var calendarContainer: DayPage.Calendar.CollectionContainerView = {
            let view = DayPage.Calendar.CollectionContainerView.create(
                dataSource: DayPage.Calendar.CollectionViewDataSource()
            ).autolayout()
            return view
        }()
        
        private lazy var tableView: UIView = {
            let view = UIView().autolayout()
            view.backgroundColor = .systemCyan
            return view
        }()
        
        private lazy var quoteView: UIView = {
            let view = UIView().autolayout()
            view.backgroundColor = .systemMint
            return view
        }()
        
        private lazy var eventsView: UIView = {
            let view = UIView().autolayout()
            view.backgroundColor = .systemPurple
            return view
        }()
        
        // MARK: - Init
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubViews()
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Public Methods
        
        func renderDate(viewState: DayPage.DateView.ViewState) {
            dateView.renderDate(viewState: viewState)
        }
        
        // MARK: - Private Methods
        
        private func addSubViews() {
            addSubview(dateView)
            addSubview(calendarContainer)
            addSubview(tableView)
            addSubview(quoteView)
            addSubview(eventsView)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                dateView.leadingAnchor.constraint(equalTo: leadingAnchor),
                dateView.topAnchor.constraint(equalTo: topAnchor),
                dateView.widthAnchor.constraint(equalTo: widthAnchor,
                                                multiplier: Constants.dateViewWidthMultiplier),
                dateView.heightAnchor.constraint(equalTo: dateView.widthAnchor,
                                                 multiplier: Constants.dateViewHeightMultiplier),
                
                calendarContainer.leadingAnchor.constraint(equalTo: dateView.trailingAnchor),
                calendarContainer.topAnchor.constraint(equalTo: topAnchor),
                calendarContainer.widthAnchor.constraint(equalTo: dateView.widthAnchor),
                calendarContainer.heightAnchor.constraint(equalTo: dateView.heightAnchor),
                
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.topAnchor.constraint(equalTo: dateView.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: calendarContainer.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                quoteView.leadingAnchor.constraint(equalTo: calendarContainer.trailingAnchor),
                quoteView.topAnchor.constraint(equalTo: topAnchor),
                quoteView.trailingAnchor.constraint(equalTo: trailingAnchor),
                quoteView.heightAnchor.constraint(equalTo: dateView.heightAnchor),
                
                eventsView.leadingAnchor.constraint(equalTo: calendarContainer.trailingAnchor),
                eventsView.topAnchor.constraint(equalTo: quoteView.bottomAnchor),
                eventsView.trailingAnchor.constraint(equalTo: trailingAnchor),
                eventsView.bottomAnchor.constraint(equalTo: bottomAnchor)
                
            ])
        }
        
    }
    
}

extension DayPage.ViewCell {
    
    private func render(viewState: DayPage.ViewCell.ViewState?) {
//        guard let viewState = viewState else { return }
//        calendarView.viewState = viewState.calendarState
        
        calendarContainer.collectionViewDataSource.update(animated: false)
        calendarContainer.updateLayout(for: sections, animated: false)
    }
    
}
