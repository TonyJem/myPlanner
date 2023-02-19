import UIKit

extension Body {
    
    class View: UIView {
        
        // MARK: - Properties
        
        /// Holds the ViewState of the `Body.View` and renders it when set.
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var dayPage: DayPageProtocol = {
            let view = DayPage.View().autolayout()
            return view
        }()
        
        private lazy var weekPage = WeekPage.View().autolayout()
        private lazy var monthPage = MonthPage.View().autolayout()
        private lazy var tasksPage = TasksPage.View().autolayout()
        private lazy var notesPage = NotesPage.View().autolayout()
        
        
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
        }
        
        private func addSubViews() {
            addSubview(dayPage)
            addSubview(weekPage)
            addSubview(monthPage)
            addSubview(tasksPage)
            addSubview(notesPage)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                dayPage.leadingAnchor.constraint(equalTo: leadingAnchor),
                dayPage.topAnchor.constraint(equalTo: topAnchor),
                dayPage.trailingAnchor.constraint(equalTo: trailingAnchor),
                dayPage.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                weekPage.leadingAnchor.constraint(equalTo: leadingAnchor),
                weekPage.topAnchor.constraint(equalTo: topAnchor),
                weekPage.trailingAnchor.constraint(equalTo: trailingAnchor),
                weekPage.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                monthPage.leadingAnchor.constraint(equalTo: leadingAnchor),
                monthPage.topAnchor.constraint(equalTo: topAnchor),
                monthPage.trailingAnchor.constraint(equalTo: trailingAnchor),
                monthPage.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                tasksPage.leadingAnchor.constraint(equalTo: leadingAnchor),
                tasksPage.topAnchor.constraint(equalTo: topAnchor),
                tasksPage.trailingAnchor.constraint(equalTo: trailingAnchor),
                tasksPage.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                notesPage.leadingAnchor.constraint(equalTo: leadingAnchor),
                notesPage.topAnchor.constraint(equalTo: topAnchor),
                notesPage.trailingAnchor.constraint(equalTo: trailingAnchor),
                notesPage.bottomAnchor.constraint(equalTo: bottomAnchor)
                
            ])
        }
        
        private func render(viewState: ViewState?) {
            guard let viewState = viewState else { return }
            switch viewState.activePage {
            case .day:
                dayPage.viewState = DayPage.ViewState(
                    calendarState: DayPage.Calendar.ViewState(
                        testText: "Rendered in Body.View"
                    )
                )
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
            dayPage.isHidden = false
            weekPage.isHidden = true
            monthPage.isHidden = true
            tasksPage.isHidden = true
            notesPage.isHidden = true
        }
        
        private func showWeekPage() {
            dayPage.isHidden = true
            weekPage.isHidden = false
            monthPage.isHidden = true
            tasksPage.isHidden = true
            notesPage.isHidden = true
        }
        
        private func showMonthPage() {
            dayPage.isHidden = true
            weekPage.isHidden = true
            monthPage.isHidden = false
            tasksPage.isHidden = true
            notesPage.isHidden = true
        }
        
        private func showTasksPage() {
            dayPage.isHidden = true
            weekPage.isHidden = true
            monthPage.isHidden = true
            tasksPage.isHidden = false
            notesPage.isHidden = true
        }
        
        private func showNotesPage() {
            dayPage.isHidden = true
            weekPage.isHidden = true
            monthPage.isHidden = true
            tasksPage.isHidden = true
            notesPage.isHidden = false
        }
        
    }
    
}

// MARK: - Viewstate

extension Body.View {
    
    struct ViewState {
        
        let activePage: Header.PageTab.PageTabType
        
    }
    
}
