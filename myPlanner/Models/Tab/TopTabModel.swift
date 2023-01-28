class TopTabModel: TabModel {
    
    private var topTabs: [Tab] = [
        Tab(title: "Day", defaultColor: .tabDayBackround),
        Tab(title: "Week", defaultColor: .tabWeekBackround),
        Tab(title: "Month", defaultColor: .tabMonthBackround),
        Tab(title: "Tasks", defaultColor: .tabTasksBackround),
        Tab(title: "Notes", defaultColor: .tabNotesBackround)
    ]
    
    override init() {
        super.init()
        
        topTabs[activeTabIndex].isActive = true
        self.tabs = topTabs
    }
}
