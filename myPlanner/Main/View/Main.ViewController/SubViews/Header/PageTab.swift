import UIKit

struct PageTab {
    
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

extension PageTab {
    
    enum PageTabType {
        
        case day
        case week
        case month
        case tasks
        case notes
        
        var tabTitle: String {
            switch self {
            case .day:
                return "Day"
            case .week:
                return "Week"
            case .month:
                return "Month"
            case .tasks:
                return "Tasks"
            case .notes:
                return "Notes"
            }
        }
        
        var tabColor: UIColor {
            switch self {
            case .day:
                return .tabDayBackground
            case .week:
                return .tabWeekBackground
            case .month:
                return .tabMonthBackground
            case .tasks:
                return .tabTasksBackground
            case .notes:
                return .tabNotesBackground
            }
        }
        
    }
    
}
