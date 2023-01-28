class TopTabModel: TabModel {
    
    private var topTabs: [Tab] = [
        Tab(title: "Day", inactiveColor: .tabDayBackround),
        Tab(title: "Week", inactiveColor: .tabWeekBackround),
        Tab(title: "Month", inactiveColor: .tabMonthBackround),
        Tab(title: "Tasks", inactiveColor: .tabTasksBackround),
        Tab(title: "Notes", inactiveColor: .tabNotesBackround)
    ]
    
    override init() {
        super.init()
        
        topTabs[activeTabIndex].isActive = true
        self.tabs = topTabs
    }
}
