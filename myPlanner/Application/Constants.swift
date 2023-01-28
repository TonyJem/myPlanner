import UIKit

struct Constants {
    
    enum TopTabPanel {
        static let height: CGFloat = 30.0
        static let horizontalInset: CGFloat = 315.0
        static let tabApposition: CGFloat = 7.0
    }
    
    enum BottomTabPanel {
        static let height: CGFloat = 30.0
        static let width = UIScreen.main.bounds.width - (2 * horizontalInset)
        static let horizontalInset: CGFloat = 130.0
        static let defaultTabWidth: CGFloat = 100.0
        static let tabApposition: CGFloat = 7.0
    }
}
