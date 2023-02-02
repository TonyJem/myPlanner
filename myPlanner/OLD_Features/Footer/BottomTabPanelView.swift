import UIKit

class BottomTabPanelView: UIView {
    
    enum Constants {
        
        static let height: CGFloat = 30.0
        static let horizontalInset: CGFloat = 130.0
        static let defaultTabWidth: CGFloat = 100.0
        static let tabApposition: CGFloat = 7.0
        
    }
    
    private let model = BottomTabModel()
    private let tabApposition = Constants.tabApposition
    
    private var tabViews: [BottomTab] = []
    
    private var tabWidth: CGFloat {
        let panelWidth = UIScreen.main.bounds.width - (2 * Constants.horizontalInset)
        let averageTabWidth = (panelWidth - tabApposition) / CGFloat(model.tabs.count) + tabApposition
        let defaultTabWidth = Constants.defaultTabWidth
        let tabWidth = min(averageTabWidth, defaultTabWidth)
        return tabWidth
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTabs()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    private func setupTabs() {
        var x: CGFloat = .zero
        for (index, tab) in model.tabs.enumerated() {
            let frame: CGRect = CGRect(x: x,
                                       y: .zero,
                                       width: tabWidth,
                                       height: Constants.height)
            let tabView = BottomTab(frame: frame, tab: tab, index: index)
            tabView.bottomTabDelegate = self
            x = x + tabWidth - tabApposition
            addSubview(tabView)
            tabViews.append(tabView)
        }
    }
}

// MARK: - BottomTab Delegate
extension BottomTabPanelView: BottomTabDelegate {
    func didSelectTabAt(index: Int) {
        let recentlySelectedTabIndex = model.activeTabIndex
        guard index != recentlySelectedTabIndex else { return }
        model.activateTab(by: index)
        tabViews[index].tab = model.tabs[index]
        tabViews[recentlySelectedTabIndex].tab = model.tabs[recentlySelectedTabIndex]
    }
}