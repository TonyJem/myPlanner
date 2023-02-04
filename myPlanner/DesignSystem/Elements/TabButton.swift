import UIKit

//TODO: Write comments for each step, so it will be easy to understand algorithm later, while it will be needed to look at it again next time
protocol TabButtonProtocol: UIButton {
    
    var viewState: TabButton.ViewState { get set }
    
}

class TabButton: UIButton, TabButtonProtocol {
    
    enum Constants {
        
        /// Tab rounding radius.
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
    //Decide if these both methods are needed, or may be some of is redundant? So please Check it!
    //Check it only when all tabs in Header are fully working
    private func reloadLayer() {
        
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

//MARK: - Viewstate

extension TabButton {
    
    struct ViewState {
        
        enum TabButtonType {
            case top
            case bottom
        }
        
        let type: TabButtonType
        let title: String
        let color: UIColor
        let isActive: Bool
        
        static let initial: ViewState = ViewState(
            type: .top,
            title: "Title",
            color: .tabDayBackround,
            isActive: false
        )
        
        init(type: TabButtonType, title: String, color: UIColor, isActive: Bool = false) {
            self.type = type
            self.title = title
            self.color = color
            self.isActive = isActive
        }
        
    }
    
}

// MARK: - Draw TabButton shape as a Trapezium with rounded corners

extension TabButton {
    
    override func draw(_ rect: CGRect) {
        
        /// Converts `tabAlignmentAngle` value from degrees into radians.
        let alignmentAngle: CGFloat = Constants.tabAlignmentAngle * .pi / 180
        
        switch viewState.type {
        case .top:
            drawTopTabButton(angle: alignmentAngle, size: rect.size)
        case .bottom:
            drawBottomTabButton(angle: alignmentAngle, size: rect.size)
        }
        
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
