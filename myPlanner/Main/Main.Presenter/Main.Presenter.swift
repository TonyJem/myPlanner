import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        weak var view: MainView?
        
        var presenterClosure: (() -> Void) = { }
        
    }
    
}


// MARK: - MainPresenter protocol implementation

extension Main.Presenter: MainPresenter {
    
    func viewDidLoad() {
        view?.render(viewState: createInitialMainViewState())
    }
    
}

// MARK: - Create ViewStates

extension Main.Presenter {
    
    static let dayTabViewState = TabButton.ViewState(
        type: .top,
        title: "Day",
        color: .tabDayBackground,
        tabAction: {
            print("🟢🟢🟢 Main.Presenter")
        }
    )
    
    static let weekTabViewState = TabButton.ViewState(type: .top, title: "Week", color: .tabWeekBackground, tabAction: { })
    static let monthTabViewState = TabButton.ViewState(type: .top, title: "Month", color: .tabMonthBackground, tabAction: { })
    static let tasksTabViewState = TabButton.ViewState(type: .top, title: "Tasks", color: .tabTasksBackground, tabAction: { })
    static let notesTabViewState = TabButton.ViewState(type: .top, title: "Notes", color: .tabNotesBackground, tabAction: { })
    
    enum PageTab {
        
        case day
        case week
        case month
        case tasks
        case notes
        
        var viewState: TabButton.ViewState {
            switch self {
            case .day:
                return dayTabViewState
            case .week:
                return dayTabViewState
            case .month:
                return monthTabViewState
            case .tasks:
                return tasksTabViewState
            case .notes:
                return notesTabViewState
            }
        }
        
    }
    
    private func createWeekTabViewState() -> TabButton.ViewState {
        .init(
            type: .top,
            title: "Week",
            color: .tabWeekBackground,
            tabAction: {
                print("Print in Week Button")
                self.view?.render(viewState: self.createWeekMainViewState())
            }
        )
    }
    
    private func createInitialMainViewState() -> Main.ViewState {
    
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    Tabb(type: .day),
                    Tabb(type: .week),
                    Tabb(type: .month)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .day))
    
    }
    
    private func createWeekMainViewState() -> Main.ViewState {
        
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabs: [
                    Tabb(type: .day),
                    Tabb(type: .week),
                    Tabb(type: .month)
                ])
        ),
              bodyViewState: Body.View.ViewState(activePage: .week))
        
    }
    
}
