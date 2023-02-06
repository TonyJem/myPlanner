import UIKit

protocol MainModule {
    
    func getView() -> UIViewController
    
}


extension Main {
    
    class Module: MainModule {
        
        func getView() -> UIViewController {
            let presenter = Presenter()
            let view = ViewController(presenter: presenter)
            presenter.view = view
            return view
        }
        
    }
    
}
