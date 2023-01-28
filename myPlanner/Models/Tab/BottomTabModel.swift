import Foundation

class BottomTabModel: TabModel {
    
    var bottomTabs: [Tab] = [
        Tab(title: "JAN", inactiveColor: .tabBackroundMonth01),
        Tab(title: "FEB", inactiveColor: .tabBackroundMonth02),
        Tab(title: "MAR", inactiveColor: .tabBackroundMonth03),
        Tab(title: "APR", inactiveColor: .tabBackroundMonth04),
        Tab(title: "MAY", inactiveColor: .tabBackroundMonth05),
        Tab(title: "JUN", inactiveColor: .tabBackroundMonth06),
        Tab(title: "JUL", inactiveColor: .tabBackroundMonth07),
        Tab(title: "AUG", inactiveColor: .tabBackroundMonth08),
        Tab(title: "SEP", inactiveColor: .tabBackroundMonth09),
        Tab(title: "OCT", inactiveColor: .tabBackroundMonth10),
        Tab(title: "NOV", inactiveColor: .tabBackroundMonth11),
        Tab(title: "DEC", inactiveColor: .tabBackroundMonth12)
    ]
    
    override init() {
        super.init()
        
        bottomTabs[activeTabIndex].isActive = true
        self.tabs = bottomTabs
    }
}
