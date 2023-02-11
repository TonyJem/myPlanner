import Foundation

class BottomTabModel: TabModel {
    
    var bottomTabs: [Tab] = [
        Tab(title: "JAN", inactiveColor: .tabBackgroundMonth01),
        Tab(title: "FEB", inactiveColor: .tabBackgroundMonth02),
        Tab(title: "MAR", inactiveColor: .tabBackgroundMonth03),
        Tab(title: "APR", inactiveColor: .tabBackgroundMonth04),
        Tab(title: "MAY", inactiveColor: .tabBackgroundMonth05),
        Tab(title: "JUN", inactiveColor: .tabBackgroundMonth06),
        Tab(title: "JUL", inactiveColor: .tabBackgroundMonth07),
        Tab(title: "AUG", inactiveColor: .tabBackgroundMonth08),
        Tab(title: "SEP", inactiveColor: .tabBackgroundMonth09),
        Tab(title: "OCT", inactiveColor: .tabBackgroundMonth10),
        Tab(title: "NOV", inactiveColor: .tabBackgroundMonth11),
        Tab(title: "DEC", inactiveColor: .tabBackgroundMonth12)
    ]
    
    override init() {
        super.init()
        
        bottomTabs[activeTabIndex].isActive = true
        self.tabs = bottomTabs
    }
}
