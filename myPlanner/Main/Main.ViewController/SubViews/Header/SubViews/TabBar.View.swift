import UIKit

extension Header.TabBar {
    
    class View: UIView {
        
        // MARK: - SubViews
        
        private lazy var subView: TabButtonProtocol = {
            let tab = TabButton().autolayout()
            //TODO: Investigate why if tab.backgroundColor = .clear I can't see subView at all
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

