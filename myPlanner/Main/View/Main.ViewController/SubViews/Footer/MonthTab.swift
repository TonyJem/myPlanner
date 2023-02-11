import UIKit

struct MonthTab {
    
    let type: PageTabType
    let isActive: Bool
    let action: ((PageTabType) -> Void)
    
    init(
        type: PageTabType,
        isActive: Bool = false,
        action: @escaping ((PageTabType) -> Void))
    {
        self.type = type
        self.isActive = isActive
        self.action = action
    }
    
}

extension MonthTab {
    
    enum PageTabType {
        
        case january
        case february
        case march
        
        var tabTitle: String {
            switch self {
            case .january:
                return "JAN"
            case .february:
                return "FEB"
            case .march:
                return "MAR"
            }
        }
        
        var tabColor: UIColor {
            switch self {
            case .january:
                return .tabBackgroundMonth01
            case .february:
                return .tabBackgroundMonth02
            case .march:
                return .tabBackgroundMonth03
            }
        }
        
    }
    
}

