import UIKit

struct CalendarSection: Hashable {
    
    let type: DayPage.Calendar.SectionType
    let items: [CalendarItem]
    
}

struct CalendarItem: Hashable {
    
    let title: String
    
}

extension DayPage {
    
    final class ViewCell: UICollectionViewCell {
        
        enum Constants {
            
            static let dateViewWidthMultiplier: CGFloat = 0.25
            static let dateViewHeightMultiplier: CGFloat = 6/7
            
        }
        
        // MARK: - Properties
        
        var sections: [CalendarSection] = [
        
            CalendarSection(
                type: .weekDays,
                items: [
                CalendarItem(title: "Mon"),
                CalendarItem(title: "Tue"),
                CalendarItem(title: "Wed"),
                CalendarItem(title: "Thu"),
                CalendarItem(title: "Fri"),
                CalendarItem(title: "Sat"),
                CalendarItem(title: "Sun")
            ]),
            
            CalendarSection(
                type: .monthDays,
                items: [
                CalendarItem(title: "1"),
                CalendarItem(title: "2"),
                CalendarItem(title: "3"),
                CalendarItem(title: "4"),
                CalendarItem(title: "5"),
                CalendarItem(title: "6"),
                CalendarItem(title: "7"),
                CalendarItem(title: "8"),
                CalendarItem(title: "9"),
                CalendarItem(title: "10"),
                CalendarItem(title: "11"),
                CalendarItem(title: "12"),
                CalendarItem(title: "13"),
                CalendarItem(title: "14"),
                CalendarItem(title: "15"),
                CalendarItem(title: "16"),
                CalendarItem(title: "17"),
                CalendarItem(title: "18"),
                CalendarItem(title: "19"),
                CalendarItem(title: "20"),
                CalendarItem(title: "21"),
                CalendarItem(title: "22"),
                CalendarItem(title: "23"),
                CalendarItem(title: "24"),
                CalendarItem(title: "25"),
                CalendarItem(title: "26"),
                CalendarItem(title: "27"),
                CalendarItem(title: "28"),
                CalendarItem(title: "29"),
                CalendarItem(title: "30"),
                CalendarItem(title: "31"),
                CalendarItem(title: "32"),
                CalendarItem(title: "33"),
                CalendarItem(title: "34"),
                CalendarItem(title: "35"),
                CalendarItem(title: "36"),
                CalendarItem(title: "37"),
                CalendarItem(title: "38"),
                CalendarItem(title: "39"),
                CalendarItem(title: "40"),
                CalendarItem(title: "41"),
                CalendarItem(title: "42")
            ])
        
        ]
        
        static let identifier = String(describing: ViewCell.self)
        
        var viewState: ViewState? {
            didSet {
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
        
        calendarContainer.collectionViewDataSource.update(sections: sections, animated: false)
    }
    
}
