import UIKit

extension Calendar {
    
    class GridCell: UICollectionViewCell {
        
        // MARK: - Properties
        static let identifier = String(describing: GridCell.self)
        
        /// Holds the viewState of the `GridCell` and renders it when set.
        var viewState: ItemViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        private lazy var label: UILabel = {
            let label = UILabel().autolayout()
            
//        TODO: remove label.text when is not needed
            label.text = "88"
            return label
        }()
        
        // MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        private func setup() {
            contentView.backgroundColor = .white
            addSubview(label)
            render(viewState: nil)
        }
        
        private func render(viewState: ItemViewState?) {
            guard let viewState = viewState else { return }
            label.text = viewState.text
        }
        
    }
    
}

// MARK: - Setup Layout
extension Calendar.GridCell {
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
}
