import UIKit

extension Template {
    
    class View: UIView {
        
        enum Constants {
            
            static let someConstant: CGFloat = 30.0
            
        }
        
        // MARK: - SubViews
        private lazy var subView = UIView().autolayout()
        
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
            backgroundColor = .gray
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
