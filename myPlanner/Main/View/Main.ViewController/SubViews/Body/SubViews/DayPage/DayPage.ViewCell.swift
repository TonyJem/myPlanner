import UIKit

extension DayPage {
    
    final class ViewCell: UICollectionViewCell {
        
        enum Constants {
            
            static let dateViewWidthMultiplier: CGFloat = 0.25
            static let dateViewHeightMultiplier: CGFloat = 6/7
            
        }
        
        // MARK: - Properties
        
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
        // TODO: Think if we should handle errors in all viewStates unwraping places
        // such as missing viewState or may be use FatalError...?
        guard let viewState = viewState else { return }
        let newSections = transform(viewState)
        calendarContainer.collectionViewDataSource.update(newSections, animated: false)
    }
    
    private func transform(_ viewState: DayPage.ViewCell.ViewState) -> [DayPage.Calendar.Section] {
        var weekDayItems: [DayPage.Calendar.Section.Item] = []
        viewState.calendarState.weekDays.forEach { weekDayTitle in
            let calendarItem = DayPage.Calendar.Section.Item(title: weekDayTitle, config: nil)
            weekDayItems.append(calendarItem)
        }
        let weekDaysSection = DayPage.Calendar.Section(
            type: .weekDays,
            items: weekDayItems
        )
        
        var monthDayItems: [DayPage.Calendar.Section.Item] = []
        viewState.calendarState.monthItems.forEach { monthItem in
            let calendarItem = DayPage.Calendar.Section.Item(title: monthItem.title, config: monthItem.config)
            monthDayItems.append(calendarItem)
        }
        let monthDaysSection = DayPage.Calendar.Section(
            type: .monthDays,
            items: monthDayItems
        )
        
        return [weekDaysSection, monthDaysSection]
    }
    
}
