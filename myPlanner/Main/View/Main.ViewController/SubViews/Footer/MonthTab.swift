import UIKit

struct MonthTab {
    
    let type: MonthTabType
    let isActive: Bool
    let action: ((MonthTabType) -> Void)
    
    init(
        type: MonthTabType,
        isActive: Bool = false,
        action: @escaping ((MonthTabType) -> Void))
    {
        self.type = type
        self.isActive = isActive
        self.action = action
    }
    
}

extension MonthTab {
    
    enum MonthTabType {
        
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

