import UIKit

extension DayPage {
    
    final class ViewCell: UICollectionViewCell {
        
        enum Constants {
            
            static let dateViewWidthMultiplier: CGFloat = 0.25
            static let dateViewHeightMultiplier: CGFloat = 6/7
            
        }
        
        static let identifier = "ViewCellIdentifier"
        
        // MARK: - SubViews
        private lazy var dateView: DayPage.Date.View = {
            let view = DayPage.Date.View().autolayout()
            return view
        }()
        
        private lazy var calendarView: Calendar.View = {
            let view = Calendar.View().autolayout()
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
            
            setupViews()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Public Methods
        func renderDate(viewState: DayPage.Date.ViewState) {
            dateView.renderDate(viewState: viewState)
        }
        
        // MARK: - Private Methods
        private func setupViews() {
            addSubview(dateView)
            addSubview(calendarView)
            addSubview(tableView)
            addSubview(quoteView)
            addSubview(eventsView)
        }
        
    }
    
}

// MARK: - SetConstraints
extension DayPage.ViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            dateView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateView.topAnchor.constraint(equalTo: topAnchor),
            dateView.widthAnchor.constraint(equalTo: widthAnchor,
                                            multiplier: Constants.dateViewWidthMultiplier),
            dateView.heightAnchor.constraint(equalTo: dateView.widthAnchor,
                                             multiplier: Constants.dateViewHeightMultiplier),

            calendarView.leadingAnchor.constraint(equalTo: dateView.trailingAnchor),
            calendarView.topAnchor.constraint(equalTo: topAnchor),
            calendarView.widthAnchor.constraint(equalTo: dateView.widthAnchor),
            calendarView.heightAnchor.constraint(equalTo: dateView.heightAnchor),

            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: dateView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: calendarView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),

            quoteView.leadingAnchor.constraint(equalTo: calendarView.trailingAnchor),
            quoteView.topAnchor.constraint(equalTo: topAnchor),
            quoteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            quoteView.heightAnchor.constraint(equalTo: dateView.heightAnchor),

            eventsView.leadingAnchor.constraint(equalTo: calendarView.trailingAnchor),
            eventsView.topAnchor.constraint(equalTo: quoteView.bottomAnchor),
            eventsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            eventsView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}
