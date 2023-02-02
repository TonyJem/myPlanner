import UIKit

protocol TabButtonProtocol: UIButton {
    
    var viewState: TabButton.ViewState { get set }
    
}

class TabButton: UIButton, TabButtonProtocol {
    
    enum Constants {
        
        static let tabCornerRadius: CGFloat = 10.0
        
        /// Descrbes tab side alignment angle measured in degrees:
        static let tabAlignmentAngle: CGFloat = 15.0
        
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
        
        /// Trapezium rounding radius
        let Radius: CGFloat = Constants.tabCornerRadius
        
        /// The mathematical constant pi.
        let Pi = CGFloat.pi
        
        let alfa = Constants.tabAlignmentAngle * Pi / 180
        
        let width = rect.size.width
        
//TODO: Set H difference if TabButton is actove or not
//        let H = tab.isActive ? size.height : size.height - 3
        let height = rect.size.height
                
        let Ax: CGFloat = .zero
        let Ay: CGFloat = rect.size.height
        
        //TODO: Get rid of O point
        let Ox = Ax + 0.5 * width
        let Oy = Ay
        
        let Bx = Ox + 0.5 * width
        let By = Oy
        
        //TODO: Get rid of angle betta
        let beta = 0.5 * Pi - alfa
        
        let EF = Radius * tan(0.5 * beta)
        let FG = tan(alfa) * height
        let EG = EF + FG
        
        let C1x = Bx - EG
        let C1y = Oy - height + Radius
        
        let OB = Bx - Ox
        let OC1x = OB - EG
        
        let C2x = Ox - OC1x
        let C2y = C1y
        
        let A = CGPoint(x: Ax , y: Ay)
        let B = CGPoint(x: Bx , y: By)
        let C1 = CGPoint(x: C1x , y: C1y)
        let C2 = CGPoint(x: C2x , y: C2y)
        
        let startAngle1 = -alfa
        let endAngle1 = -0.5 * Pi
        
        //TODO: Get rid of second startAngle
        let startAngle2 = -0.5 * Pi
        let endAngle2 = Pi + alfa
        
        createTrapeziumPath(
            A: A,
            B: B,
            C1: C1,
            C2: C2,
            radius: Radius,
            startAngle1: startAngle1,
            endAngle1: endAngle1,
            startAngle2: startAngle2,
            endAngle2: endAngle2,
            clockwise: false,
            color: viewState.color
        )
        
        //TODO: Set bringSubviewToFront if TabButton is active or not
        //        if tab.isActive {
        //            superview?.bringSubviewToFront(self)
        //        }
    }
    
    private func createTrapeziumPath(
        A: CGPoint,
        B: CGPoint,
        C1: CGPoint,
        C2: CGPoint,
        radius: CGFloat,
        startAngle1: CGFloat,
        endAngle1: CGFloat,
        startAngle2: CGFloat,
        endAngle2: CGFloat,
        clockwise: Bool,
        color: UIColor
    ) {
        let path = UIBezierPath()
        path.move(to: A)
        path.addLine(to: B)
        path.addArc(withCenter: C1,
                    radius: radius,
                    startAngle: startAngle1,
                    endAngle: endAngle1,
                    clockwise: false)
        path.addArc(withCenter: C2,
                    radius: radius,
                    startAngle: startAngle2,
                    endAngle: endAngle2,
                    clockwise: false)
        path.close()
        color.set()
        path.fill()
    }
    
}
