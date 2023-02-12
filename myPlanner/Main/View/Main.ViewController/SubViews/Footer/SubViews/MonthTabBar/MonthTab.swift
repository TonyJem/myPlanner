import UIKit

extension Footer {
    
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
    
}

extension Footer.MonthTab {
    
    enum MonthTabType {
        
        case january
        case february
        case march
        case april
        case may
        case june
        case july
        case august
        case september
        case october
        case november
        case december
        
        var tabTitle: String {
            switch self {
            case .january:
                return "JAN"
            case .february:
                return "FEB"
            case .march:
                return "MAR"
            case .april:
                return "APR"
            case .may:
                return "MAY"
            case .june:
                return "JUN"
            case .july:
                return "JUL"
            case .august:
                return "AUG"
            case .september:
                return "SEP"
            case .october:
                return "OCT"
            case .november:
                return "NOV"
            case .december:
                return "DEC"
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
            case .april:
                return .tabBackgroundMonth04
            case .may:
                return .tabBackgroundMonth05
            case .june:
                return .tabBackgroundMonth06
            case .july:
                return .tabBackgroundMonth07
            case .august:
                return .tabBackgroundMonth08
            case .september:
                return .tabBackgroundMonth09
            case .october:
                return .tabBackgroundMonth10
            case .november:
                return .tabBackgroundMonth11
            case .december:
                return .tabBackgroundMonth12
            }
        }
        
    }
    
}

