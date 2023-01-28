import UIKit

extension Calendar {
    
    class View: UIView {
        
        // MARK: - Sub Views
        private lazy var title: UILabel = {
            let label = UILabel().autolayout()
            label.text = "Calendar"
            return label
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
        
        // MARK: - Private Methods
        private func setupViews() {
            backgroundColor = .white
            addSubview(title)
        }
        
    }
    
}

// MARK: - SetConstraints
extension Calendar.View {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: .spacingS),
            title.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor)
            
        ])
    }
    
}
