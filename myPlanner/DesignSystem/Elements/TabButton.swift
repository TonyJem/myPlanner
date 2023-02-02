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
        let isActive: Bool
        
        static let initial: ViewState = ViewState(
            title: "Title",
            color: .tabDayBackround,
            isActive: false
        )
        
        init(title: String, color: UIColor, isActive: Bool = false) {
            self.title = title
            self.color = color
            self.isActive = isActive
        }
        
    }
    
}

// MARK: - Draw shape of Trapezium with rounded corners

extension TabButton {
    
//TODO: Write comments or each step, so it will be easy to understand algorithm later, while it will be needed to look at it again next time
    override func draw(_ rect: CGRect) {
        
        /// Trapezium rounding radius
        let cornerRadius: CGFloat = Constants.tabCornerRadius
        
        /// Converts `tabAlignmentAngle` value from degrees into radians.
        let alignmentAngle = Constants.tabAlignmentAngle * .pi / 180
        
        drawTopTabButton(with: cornerRadius, and: alignmentAngle, for: rect.size)
        
//        drawBottomTabButton(with: cornerRadius, and: alignmentAngle, for: rect.size)
    }
    
    private func drawTopTabButton(with radius: CGFloat, and angle: CGFloat, for size: CGSize) {
        let height = size.height
        let leftArcCenter = CGPoint(
            x: radius * tan(0.5 * (0.5 * .pi - angle)) + tan(angle) * height,
            y: radius)
        createTrapeziumPath(
            startBaseLine: CGPoint(x: .zero, y: height),
            endBaseLine: CGPoint(x: size.width, y: height),
            leftArcCenter: leftArcCenter,
            rightArcCenter: CGPoint(x: size.width - leftArcCenter.x, y: radius),
            cornerRadius: radius,
            startAngle1: -angle,
            endAngle1: -0.5 * .pi,
            endAngle2: .pi + angle,
            clockwise: false,
            color: viewState.color
        )
    }
    
    private func drawBottomTabButton(with radius: CGFloat, and angle: CGFloat, for size: CGSize) {
        let height = size.height
        let leftArcCenter = CGPoint(
            x: radius * tan(0.5 * (0.5 * .pi - angle)) + tan(angle) * height,
            y: height - radius)
        createTrapeziumPath(
            startBaseLine: .zero,
            endBaseLine: CGPoint(x: size.width, y: .zero),
            leftArcCenter: leftArcCenter,
            rightArcCenter: CGPoint(x: size.width - leftArcCenter.x, y: height - radius),
            cornerRadius: radius,
            startAngle1: angle,
            endAngle1: 0.5 * .pi,
            endAngle2: .pi - angle,
            clockwise: true,
            color: viewState.color
        )
    }
    
    /*
    private func drawBottomTabButton() {
        
        /// Trapezium rounding radius
        let radius: CGFloat = Constants.tabCornerRadius
        
        /// Converts `tabAlignmentAngle` value from degrees into radians.
        let alfa = Constants.tabAlignmentAngle * .pi / 180
        
        let width = rect.size.width
        
//TODO: Set H difference if TabButton is actove or not
//        let H = tab.isActive ? size.height : size.height - 3
        let height = rect.size.height
        
        let C1x = radius * tan(0.5 * (0.5 * .pi - alfa)) + tan(alfa) * height
        
        createTrapeziumPath(
            startBottom: CGPoint(x: rect.origin.x, y: height),
            endBottom: CGPoint(x: width, y: height),
            center1: CGPoint(x: C1x, y: radius),
            center2: CGPoint(x: width - C1x, y: radius),
            radius: radius,
            startAngle1: -alfa,
            endAngle1: -0.5 * .pi,
            endAngle2: .pi + alfa,
            clockwise: false,
            color: viewState.color
        )
        
        //TODO: Set bringSubviewToFront if TabButton is active or not
        //        if tab.isActive {
        //            superview?.bringSubviewToFront(self)
        //        }
    }
     */
    
    private func createTrapeziumPath(
        startBaseLine: CGPoint,
        endBaseLine: CGPoint,
        leftArcCenter: CGPoint,
        rightArcCenter: CGPoint,
        cornerRadius: CGFloat,
        startAngle1: CGFloat,
        endAngle1: CGFloat,
        endAngle2: CGFloat,
        clockwise: Bool,
        color: UIColor
    ) {
        let path = UIBezierPath()
        path.move(to: startBaseLine)
        path.addLine(to: endBaseLine)
        path.addArc(withCenter: rightArcCenter,
                    radius: cornerRadius,
                    startAngle: startAngle1,
                    endAngle: endAngle1,
                    clockwise: clockwise)
        path.addArc(withCenter: leftArcCenter,
                    radius: cornerRadius,
                    startAngle: endAngle1,
                    endAngle: endAngle2,
                    clockwise: clockwise)
        path.close()
        color.set()
        path.fill()
    }
    
}
