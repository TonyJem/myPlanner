import UIKit

extension DayPage.Calendar {
    
    class ViewCell: UICollectionViewCell {
        
        enum Constants {
            
            static let circleViewWidth: CGFloat = 25
            
        }
        
        static let identifier = String(describing: ViewCell.self)
        
        var viewState: CollectionViewCell.ViewState? {
            didSet {
                render(viewState: viewState)
            }
        }
        
        // MARK: - SubViews
        
        private lazy var circleView: UIView = {
            let view = UIView().autolayout()
            view.layer.cornerRadius = Constants.circleViewWidth / 2;
            view.layer.masksToBounds = true;
            return view
        }()
        
        private lazy var label: UILabel = {
            let label = UILabel().autolayout()
            label.numberOfLines = 1
            label.textAlignment = .center
            return label
        }()
        
        // MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private Methods
        private func setup() {
            contentView.backgroundColor = .white
            addSubview(circleView)
            addSubview(label)
        }
        
        private func render(viewState: CollectionViewCell.ViewState?) {
            
            guard let viewState = viewState else { return }
            
            if viewState.isToday {
                circleView.backgroundColor = .systemOrange
            } else {
                circleView.backgroundColor = .systemGray
            }
            
            circleView.isHidden = !viewState.isSelected
            
            label.text = viewState.text
            
            switch viewState.cellType {
            case .weekDay:
                label.textColor = .systemGray
                label.font = UIFont.systemFont(ofSize: 13, weight: .light)
            case .date:
                label.font = UIFont.systemFont(ofSize: 15, weight: .light)
                if viewState.isSelected {
                    label.textColor = .white
                } else {
                    label.textColor = .black
                }
                if viewState.isToday {
                    label.textColor = .systemOrange
                }
                
                if viewState.isToday && viewState.isSelected {
                    label.textColor = .white
                }
            }
            
            switch viewState.monthType {
            case .previousMonth, .nextMonth:
                label.textColor = .systemGray
            case .currentMonth:
                break
            }
            
        }
        
    }
    
}

// MARK: - SetConstraints
extension DayPage.Calendar.ViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            circleView.widthAnchor.constraint(equalToConstant: Constants.circleViewWidth),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
}
