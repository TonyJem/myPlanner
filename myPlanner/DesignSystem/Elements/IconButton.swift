import UIKit

final class IconButton: UIButton {
    let systemName: String
    let titleColor: UIColor
    let size: CGFloat
    let weight: UIImage.SymbolWeight
    
    // MARK: - Init
    
    init(
        systemName: String,
        titleColor: UIColor = .white,
        size: CGFloat = 24,
        weight: UIImage.SymbolWeight = .light
    ) {
        self.systemName = systemName
        self.titleColor = titleColor
        self.size = size
        self.weight = weight
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func didTapAction() {
        print("🟢 didTapOn IconButton")
    }
    
    // MARK: - Private Methods
    private func setup() {
        configureImage()
        tintColor = titleColor
        addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
    }
    
    private func configureImage() {
        let icon = UIImage(
        systemName: systemName,
        withConfiguration: UIImage.SymbolConfiguration(weight: weight)
        )
        setImage(icon, for: .normal)
        setPreferredSymbolConfiguration(
        UIImage.SymbolConfiguration(pointSize: size),
        forImageIn: .normal
        )
    }
    
}
