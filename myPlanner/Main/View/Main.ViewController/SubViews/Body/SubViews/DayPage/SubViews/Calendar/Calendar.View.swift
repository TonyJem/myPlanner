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
        
        private lazy var testLabel: UILabel = {
            let label = UILabel().autolayout()
            label.text = "initialText"
            label.backgroundColor = .green
            return label
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
            addSubview(testLabel)
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                
                testLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                testLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
                
            ])
        }
        
    }
    
}

extension DayPage.Calendar.View: CalendarProtocol {
    
    private func render(viewState: DayPage.Calendar.ViewState?) {
        guard let viewState = viewState else { return }
        testLabel.text = viewState.testText
    }
    
}
