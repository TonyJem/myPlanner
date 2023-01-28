import UIKit

struct Tab {
    let title: String
    let defaultColor: UIColor
    private let activeColor: UIColor = .activeTabBackround
    
    var isActive: Bool = false
    
    var backgroundColor: UIColor {
        isActive ? activeColor : defaultColor
    }
}

class TabModel {
    
    var activeTabIndex = 0
    
    var tabs: [Tab] = []
    
    func activateTab(by index: Int) {
        tabs[activeTabIndex].isActive = false
        tabs[index].isActive = true
        activeTabIndex = index
    }
}
