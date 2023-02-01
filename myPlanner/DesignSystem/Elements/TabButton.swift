import UIKit

protocol TabButtonProtocol: UIButton {
    
    var viewState: TabButton.ViewState { get set }
    
}

class TabButton: UIButton, TabButtonProtocol {
    
    enum Constants {
        
        /// Descrbes trapezium side alignment angle.
        /// Posible ranges: from 0.0 to 1.0.
        /// Here 0.0 means that trapezium side will be fully vertical,
        /// so trapezium will get just regular rectangle's shape.
        /// And with 1.0 trapezium side will be aligned by 45 degree.
        static let sideAlignmentProportion: CGFloat = 0.25
        static let tabCornerRadius: CGFloat = 10.0
        
    }
    
    /// Holds the ViewState of the `TabButton` and renders it when set.
    var viewState: ViewState = .initial {
        didSet {
            render(viewState: viewState)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
        render(viewState: .initial)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func didTapOnTabButton() {
        print("🟢 didTapOnTabButton in TabButton")
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        backgroundColor = .clear
        setTitleColor(.white, for: .normal)
        addTarget(self, action: #selector(didTapOnTabButton), for: .touchUpInside)
    }
    
    private func render(viewState: ViewState) {
        setTitle(viewState.title, for: .normal)
        reloadLayer()
    }
    
    //TODO: Check if we need to have it. Google `setNeedsDisplay` and `displayIfNeeded` and learn what they are doing
    //TODO: Decide if these both methods are needed, or may be some of is redundant? So please Check it!
    private func reloadLayer() {
        layer.setNeedsDisplay()
        layer.displayIfNeeded()
    }
}

//MARK: - Viewstate

extension TabButton {
    
    struct ViewState {
        let title: String
        let color: UIColor
        
        static let initial: ViewState = ViewState(title: "Title", color: .tabDayBackround)
        
        init(title: String, color: UIColor) {
            self.title = title
            self.color = color
        }
    }
    
}

// MARK: - Draw shape of Trapezium with rounded corners

extension TabButton {
    
//TODO: Write comments or each step, so it will be easy to understand algorithm later, while it will be needed to look at it again next time
    override func draw(_ rect: CGRect) {
        let size = self.bounds.size
        
        let W = size.width
        
//TODO: Set H difference if TabButton is actove or not
//        let H = tab.isActive ? size.height : size.height - 3
        let H = size.height
        
        let k: CGFloat = Constants.sideAlignmentProportion
        let R: CGFloat = Constants.tabCornerRadius
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
        
        // Set the background color of color
        viewState.color.set()
        path.fill()
        
//TODO: Set bringSubviewToFront if TabButton is active or not
//        if tab.isActive {
//            superview?.bringSubviewToFront(self)
//        }
    }
    
}
