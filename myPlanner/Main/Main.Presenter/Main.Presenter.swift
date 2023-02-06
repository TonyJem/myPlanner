import UIKit

protocol MainPresenter {
    
    func viewDidLoad()
    
}

extension Main {
    
    class Presenter {
        
        weak var view: MainView?
        
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
    
    static let dayTabViewState = TabButton.ViewState(type: .top, title: "Day", color: .tabDayBackround)
    static let weekTabViewState = TabButton.ViewState(type: .top, title: "Week", color: .tabWeekBackround)
    static let monthTabViewState = TabButton.ViewState(type: .top, title: "Month", color: .tabMonthBackround)
    static let tasksTabViewState = TabButton.ViewState(type: .top, title: "Tasks", color: .tabTasksBackround)
    static let notesTabViewState = TabButton.ViewState(type: .top, title: "Notes", color: .tabNotesBackround)
    
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
                return weekTabViewState
            case .month:
                return monthTabViewState
            case .tasks:
                return tasksTabViewState
            case .notes:
                return notesTabViewState
            }
        }
        
    }
    
    private func createInitialMainViewState() -> Main.ViewState {
        .init(headerViewState: Header.View.ViewState(
            tabBarViewState: TabBarView.ViewState(
                type: .top,
                tabViewStates:[
                    PageTab.day.viewState,
                    PageTab.week.viewState,
                    PageTab.month.viewState,
                    PageTab.tasks.viewState,
                    PageTab.notes.viewState
                ])))
    }
    
}
