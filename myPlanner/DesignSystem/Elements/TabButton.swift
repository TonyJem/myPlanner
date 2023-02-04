import UIKit

protocol TabButtonProtocol: UIButton {
    
    /// Holds the ViewState of the `TabButton`
    var viewState: TabButton.ViewState { get set }
    
    func reloadLayer()
    
}

/// This class defines customised button, that has shape of Trapezium with rounded corners.
/// Used for Tab's shape visualisation in UI.
final class TabButton: UIButton, TabButtonProtocol {
    
    /// Holds internal constants, that will be used same for all instances of `TabButton`.
    /// Adjustments of it will cause changes in each `TabButton` used in App.
    enum Constants {
        
        /// Describes the radius for rounding left and right top corners of Tab.
        static let tabCornerRadius: CGFloat = 10.0
        
        /// Describes Tab side's alignment angle measured in degrees:
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
    
    /// The action that will happen after tapping on particular instance of `TabButton`.
    @objc private func didTapAction() {
        print("🟢 didTapOnTabButton in TabButton")
        reloadLayer()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
//        backgroundColor = .clear
        addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
    }
    
    private func render(viewState: ViewState) {
        setTitle(viewState.title, for: .normal)
        setTitleColor(viewState.textColor, for: .normal)
        backgroundColor = .orange
        reloadLayer()
    }
    
    //TODO: Check if we need to have it. Google `setNeedsDisplay` and `displayIfNeeded` and learn what they are doing
    //Decide if these both methods are needed, or may be some of is redundant? So please Check it!
    //Check it only when all tabs in Header are fully working
    func reloadLayer() {
        
        /* Marks that -display needs to be called before the layer is next
         * committed. If a region is specified, only that region of the layer
         * is invalidated. */
        
        // https://stackoverflow.com/questions/10818319/when-do-i-need-to-call-setneedsdisplay-in-ios
        // It sounds like it should be always called when you updating any property which may change the presentation.
        layer.setNeedsDisplay()
        
        /* Call -display if receiver is marked as needing redrawing. */
        layer.displayIfNeeded()
    }
}

// MARK: - Viewstate

extension TabButton {
    
    struct ViewState {
        
        enum TabButtonType {
            case top
            case bottom
        }
        
        let type: TabButtonType
        let title: String
        let color: UIColor
        let textColor: UIColor
        let isActive: Bool
        
        static let initial: ViewState = ViewState(
            type: .top,
            title: "Title",
            color: .tabDayBackround,
            textColor: .white,
            isActive: false
        )
        
        init(type: TabButtonType, title: String, color: UIColor, textColor: UIColor = .white, isActive: Bool = false) {
            self.type = type
            self.title = title
            self.color = color
            self.textColor = textColor
            self.isActive = isActive
        }
        
    }
    
}

// MARK: - Draw TabButton shape as a Trapezium with rounded corners

extension TabButton {
    
    override func draw(_ rect: CGRect) {
        
        print("🟢🟢🟢 override func draw")
        
        /// Converts `tabAlignmentAngle` value from degrees into radians.
        let alignmentAngle: CGFloat = Constants.tabAlignmentAngle * .pi / 180
        
        // Selects `TabButton` shape's drawing method depending on type of `TabButton`:
        switch viewState.type {
        case .top:
            drawTopTabButton(angle: alignmentAngle, size: rect.size)
        case .bottom:
            drawBottomTabButton(angle: alignmentAngle, size: rect.size)
        }
        
        // Brings active tab in front of other tabs located near by:
        if viewState.isActive {
            superview?.bringSubviewToFront(self)
        }
        
    }
    
    private func drawTopTabButton(
        radius: CGFloat = Constants.tabCornerRadius,
        angle: CGFloat,
        size: CGSize
    ){
        let height = size.height
        let correction: CGFloat = viewState.isActive ? .zero : 3.0
        let leftArcCenter = CGPoint(
            x: radius * tan(0.5 * (0.5 * .pi - angle)) + tan(angle) * (height + correction),
            y: radius + correction
        )
        createTrapeziumPath(
            startBaseLine: CGPoint(x: .zero, y: height),
            endBaseLine: CGPoint(x: size.width, y: height),
            leftArcCenter: leftArcCenter,
            rightArcCenter: CGPoint(x: size.width - leftArcCenter.x, y: leftArcCenter.y),
            cornerRadius: radius,
            startAngle1: -angle,
            endAngle1: -0.5 * .pi,
            endAngle2: .pi + angle,
            clockwise: false,
            color: viewState.color
        )
    }
    
    private func drawBottomTabButton(
        radius: CGFloat = Constants.tabCornerRadius,
        angle: CGFloat,
        size: CGSize
    ){
        let height = size.height
        let correction: CGFloat = viewState.isActive ? .zero : 3.0
        let leftArcCenter = CGPoint(
            x: radius * tan(0.5 * (0.5 * .pi - angle)) + tan(angle) * (height - correction),
            y: height - radius - correction
        )
        createTrapeziumPath(
            startBaseLine: .zero,
            endBaseLine: CGPoint(x: size.width, y: .zero),
            leftArcCenter: leftArcCenter,
            rightArcCenter: CGPoint(x: size.width - leftArcCenter.x, y: leftArcCenter.y),
            cornerRadius: radius,
            startAngle1: angle,
            endAngle1: 0.5 * .pi,
            endAngle2: .pi - angle,
            clockwise: true,
            color: viewState.color
        )
    }
    
    /// Reminder about `iOS Coordinate system`:
    /// (0,0) is top left corner.
    /// so Positive X axis - from 0 to the right of screen.
    /// so Positive Y axis - from 0 to the bottom of screen.
    ///
    /// Angles in this coordinate system will be described as following:
    /// Positive (+) angle direction in iOS is going clockwise.
    /// Negative (-) angle direction in iOS is going anti-clockwise.
    ///
    /// Positive X axis: Angle 0 --> right of the screen;
    /// Negative Y axis: Angle (normal human 90), but in iOS considered as an Angle: 270 or -90 --> looks into top of the screen;
    /// Negative X axis: Angle 180  --> looks into left of the screen;
    /// Postive Y axis: Angle (normal human 270), but in iOS considered as an Angle: 90 or -270  --> bottom of the screen.
    
    /// Defines the algorithm of creating path
    /// used for drawing trapezium shape with rounded corners.
    /// All points below are described in drawing provided at Project Documentation.
    /// - Parameters:
    ///  - startBaseLine: Point `A` coordinates.
    ///  - endBaseLine: Point `B` coordinates.
    ///  - leftArcCenter: Point `C1` coordinates.
    ///  - rightArcCenter: Point `C2` coordinates.
    ///  - cornerRadius: Radius of trapezium shape corner's rounding.
    ///  - startAngle1: Angle between positive `X`axis and `C1D1` in radians.
    ///  - endAngle1: Angle between positive `X`axis and `C1E1` or `C2E2` in radians.
    ///  - endAngle2: Angle between positive `X`axis and `C2D2` in radians.
    ///  - clockwise: Direction between `startAngle` and `endAngle` needed to define which sector of the full circle should be selected as an arc.
    ///  - color: Background color of trapezium shape.
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
    ){
        let path = UIBezierPath()
        path.move(to: startBaseLine)
        path.addLine(to: endBaseLine)
        path.addArc(
            withCenter: rightArcCenter,
            radius: cornerRadius,
            startAngle: startAngle1,
            endAngle: endAngle1,
            clockwise: clockwise
        )
        path.addArc(
            withCenter: leftArcCenter,
            radius: cornerRadius,
            startAngle: endAngle1,
            endAngle: endAngle2,
            clockwise: clockwise
        )
        path.close()
        color.set()
        path.fill()
    }
    
}
