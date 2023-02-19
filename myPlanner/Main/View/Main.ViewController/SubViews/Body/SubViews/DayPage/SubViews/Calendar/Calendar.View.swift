import UIKit

protocol CalendarProtocol: UIView {
    
    /// Holds the ViewState of the `DayPage.Calendar`
    var viewState: DayPage.Calendar.ViewState? { get set }
    
}

extension DayPage.Calendar {
    
    final class View: UIView {
        
        var viewState: ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var subView: UIView = {
            let view = UIView().autolayout()
            view.backgroundColor = .orange
            return view
        }()
        
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
            backgroundColor = .green
        }
        
        private func addSubViews() {
            addSubview(subView)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                subView.leadingAnchor.constraint(equalTo: leadingAnchor),
                subView.topAnchor.constraint(equalTo: topAnchor),
                subView.trailingAnchor.constraint(equalTo: trailingAnchor),
                subView.bottomAnchor.constraint(equalTo: bottomAnchor)
                
            ])
        }
        
    }
    
}

extension DayPage.Calendar.View: CalendarProtocol {
    
    private func render(viewState: DayPage.Calendar.ViewState?) {
        guard let viewState = viewState else { return }
        
        print(viewState)
    }
    
}
