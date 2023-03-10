import Foundation

extension DayPage.Calendar {
    
    struct ViewState {
        
        let sections: [DayPage.Calendar.Section]
        
        let itemSelectedAction: ((Date) -> Void)
        
    }
    
}
