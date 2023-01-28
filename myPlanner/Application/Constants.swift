import UIKit

struct Constants {
    
    static let screenHeight = UIScreen.main.bounds.height
    static let screenWidth = UIScreen.main.bounds.width
    
    enum Layout {
        static let minimumLineSpacing: CGFloat = 0.0
        static private let headerHeightMultiplier: CGFloat = 0.075
        static let headerViewHeight = screenHeight * headerHeightMultiplier
        
        static private let footerHeightMultiplier: CGFloat = 0.04375
        static let footerViewHeight = screenHeight * footerHeightMultiplier
        
        static let dateViewWidthMultiplier: CGFloat = 0.25
        static let dateViewHeightMultiplier: CGFloat = 6/7
        
        static let horizontalInset: CGFloat = 20.0
        static let buttonHeight: CGFloat = 40.0
    }
    
    enum TabShape {
        /// Descrbes trapezium side alignment angle. Posible ranges: from 0.0 to 1.0. Here 0.0 means that trapezium side will be fully vertical, so trapezium will get just regular rectangle's shape. And with 1.0 trapezium side will be aligned by 45 degree.
        static let sideAlignmentProportion: CGFloat = 0.25
        static let tabCornerRadius: CGFloat = 10.0
    }
    
    enum TopTabPanel {
        static let height: CGFloat = 30.0
        static let horizontalInset: CGFloat = 315.0
        static let tabApposition: CGFloat = 7.0
    }
    
    enum BottomTabPanel {
        static let height: CGFloat = 30.0
        static let width = screenWidth - (2 * horizontalInset)
        static let horizontalInset: CGFloat = 130.0
        static let defaultTabWidth: CGFloat = 100.0
        static let tabApposition: CGFloat = 7.0
    }
}
