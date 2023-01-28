import UIKit

protocol TopTabDelegate: AnyObject {
    func didSelectTabAt(index: Int)
}

class TopTab: UIButton {
    
    enum LocalConstants {
        
        /// Descrbes trapezium side alignment angle. Posible ranges: from 0.0 to 1.0. Here 0.0 means that trapezium side will be fully vertical, so trapezium will get just regular rectangle's shape. And with 1.0 trapezium side will be aligned by 45 degree.
        static let sideAlignmentProportion: CGFloat = 0.25
        static let tabCornerRadius: CGFloat = 10.0
        
    }
    
    let index: Int
    
    var tab: Tab {
        didSet {
            reloadTabLayer()
        }
    }
    
    weak var topTabDelegate: TopTabDelegate?
    
    // MARK: - Init
    init(frame: CGRect, tab: Tab, index: Int) {
        self.tab = tab
        self.index = index
        
        super.init(frame: frame)
        
        backgroundColor = .clear
        setTitleColor(.gray, for: .normal)
        setTitle(tab.title, for: .normal)
        addTarget(self, action: #selector(topTabButtonDidTap), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc private func topTabButtonDidTap() {
        topTabDelegate?.didSelectTabAt(index: index)
    }
    
    // MARK: - Private Methods
    private func reloadTabLayer() {
        layer.setNeedsDisplay()
        layer.displayIfNeeded()
    }
}

// MARK: - Draw shape of Trapezium with rounded corners
extension TopTab {
    override func draw(_ rect: CGRect) {
        let size = self.bounds.size
        
        let W = size.width
        let H = tab.isActive ? size.height : size.height - 3
        
        let k: CGFloat = LocalConstants.sideAlignmentProportion
        let R: CGFloat = LocalConstants.tabCornerRadius
        let Pi = CGFloat.pi
        
        let Ax: CGFloat = .zero
        let Ay: CGFloat = size.height
        
        let Ox = Ax + 0.5 * W
        let Oy = Ay
        
        let Bx = Ox + 0.5 * W
        let By = Oy
        
        let alfa = atan(k)
        let beta = 0.5 * Pi - alfa
        
        let EF = R * tan(0.5 * beta)
        let FG = k * H
        let EG = EF + FG
        
        let C1x = Bx - EG
        let C1y = Oy - H + R
        
        let OB = Bx - Ox
        let OC1x = OB - EG
        
        let C2x = Ox - OC1x
        let C2y = C1y
        
        let A = CGPoint(x: Ax , y: Ay)
        let B = CGPoint(x: Bx , y: By)
        let C1 = CGPoint(x: C1x , y: C1y)
        let C2 = CGPoint(x: C2x , y: C2y)
        
        let path = UIBezierPath()
        
        path.move(to: A)
        
        path.addLine(to: B)
        
        path.addArc(withCenter: C1,
                    radius: R,
                    startAngle: -1 * alfa,
                    endAngle: 3 * Pi / 2,
                    clockwise: false)
        
        path.addArc(withCenter: C2,
                    radius: R,
                    startAngle: 3 * Pi / 2,
                    endAngle: Pi + alfa,
                    clockwise: false)
        
        path.close()
        
        tab.backgroundColor.set()
        path.fill()
        
        if tab.isActive {
            superview?.bringSubviewToFront(self)
        }
    }
}
