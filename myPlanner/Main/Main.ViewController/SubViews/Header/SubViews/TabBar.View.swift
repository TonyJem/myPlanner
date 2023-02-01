import UIKit

extension TabBar {
    
    class View: UIView {
        
        // MARK: - SubViews
        
        
        private lazy var subView: TabButton = {
            let tab = TabButton().autolayout()
            tab.backgroundColor = .orange
            return tab
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
                subView.widthAnchor.constraint(equalToConstant: 100),
                subView.heightAnchor.constraint(equalToConstant: 30),
                subView.bottomAnchor.constraint(equalTo: bottomAnchor)
                
            ])
        }
        
    }
    
}

