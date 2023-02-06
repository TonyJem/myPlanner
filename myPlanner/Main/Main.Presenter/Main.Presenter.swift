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
        
    }
    
}
