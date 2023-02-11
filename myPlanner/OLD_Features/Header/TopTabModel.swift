class TopTabModel: TabModel {
    
    private var topTabs: [Tab] = [
        Tab(title: "Day", inactiveColor: .tabDayBackground),
        Tab(title: "Week", inactiveColor: .tabWeekBackground),
        Tab(title: "Month", inactiveColor: .tabMonthBackground),
        Tab(title: "Tasks", inactiveColor: .tabTasksBackground),
        Tab(title: "Notes", inactiveColor: .tabNotesBackground)
    ]
    
    override init() {
        super.init()
        
        topTabs[activeTabIndex].isActive = true
        self.tabs = topTabs
    }
}
