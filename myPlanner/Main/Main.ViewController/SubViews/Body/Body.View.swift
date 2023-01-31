import UIKit

extension Body {
    
    class View: UIView {
        
        // MARK: - SubViews
        
        private lazy var subView = DayPage.View().autolayout()
        
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
                
                subView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacingL),
                subView.topAnchor.constraint(equalTo: topAnchor, constant: .spacingL),
                subView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacingL),
                subView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.spacingL)
                
            ])
        }
        
    }
    
}
