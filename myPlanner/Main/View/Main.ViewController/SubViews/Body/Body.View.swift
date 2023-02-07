import UIKit

extension Body {
    
    class View: UIView {
        
        /// Holds the ViewState of the `Body.View` and renders it when set.
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var dayPageView = DayPage.View().autolayout()
        private lazy var weekPageView = WeekPage.View().autolayout()
        private lazy var monthPageView = MonthPage.View().autolayout()
        private lazy var tasksPageView = TasksPage.View().autolayout()
        private lazy var notesPageView = NotesPage.View().autolayout()
        
        
        // MARK: - Init
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
            addSubViews()
            setupLayout()
            showWeekPage()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        
        private func setupView() {
        }
        
        private func addSubViews() {
            addSubview(dayPageView)
            addSubview(weekPageView)
            addSubview(monthPageView)
            addSubview(tasksPageView)
            addSubview(notesPageView)
            
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                dayPageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                dayPageView.topAnchor.constraint(equalTo: topAnchor),
                dayPageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                dayPageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                weekPageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                weekPageView.topAnchor.constraint(equalTo: topAnchor),
                weekPageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                weekPageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                monthPageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                monthPageView.topAnchor.constraint(equalTo: topAnchor),
                monthPageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                monthPageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                tasksPageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tasksPageView.topAnchor.constraint(equalTo: topAnchor),
                tasksPageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                tasksPageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                notesPageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                notesPageView.topAnchor.constraint(equalTo: topAnchor),
                notesPageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                notesPageView.bottomAnchor.constraint(equalTo: bottomAnchor)
                
            ])
        }
        
        private func render(viewState: ViewState?) {
            guard let viewState = viewState else { return }
            switch viewState.activePage {
            case .day:
                showDayPage()
            case .week:
                showWeekPage()
            case .month:
                showMonthPage()
            case .tasks:
                showTasksPage()
            case .notes:
                showNotesPage()
            }

        }
        
        private func showDayPage() {
            dayPageView.isHidden = false
            weekPageView.isHidden = true
            monthPageView.isHidden = true
            tasksPageView.isHidden = true
            notesPageView.isHidden = true
        }
        
        private func showWeekPage() {
            dayPageView.isHidden = true
            weekPageView.isHidden = false
            monthPageView.isHidden = true
            tasksPageView.isHidden = true
            notesPageView.isHidden = true
        }
        
        private func showMonthPage() {
            dayPageView.isHidden = true
            weekPageView.isHidden = true
            monthPageView.isHidden = false
            tasksPageView.isHidden = true
            notesPageView.isHidden = true
        }
        
        private func showTasksPage() {
            dayPageView.isHidden = true
            weekPageView.isHidden = true
            monthPageView.isHidden = true
            tasksPageView.isHidden = false
            notesPageView.isHidden = true
        }
        
        private func showNotesPage() {
            dayPageView.isHidden = true
            weekPageView.isHidden = true
            monthPageView.isHidden = true
            tasksPageView.isHidden = true
            notesPageView.isHidden = false
        }
        
    }
    
}

// MARK: - Viewstate

extension Body.View {
    
    struct ViewState {
        
        let activePage: PageTab.PageTabType
        
    }
    
}
