import UIKit

struct Tab {
    let title: String
    let inactiveColor: UIColor
    
    var isActive: Bool = false
    
    var backgroundColor: UIColor {
        isActive ? activeColor : inactiveColor
    }
    
    private let activeColor: UIColor = .activeTabBackround
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
