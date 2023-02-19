import UIKit

protocol MainModule {
    
    func getView(provider: MainProviderProtocol) -> UIViewController
    
}


extension Main {
    
    class Module: MainModule {
        
        func getView(provider: MainProviderProtocol) -> UIViewController {
            
            let presenter = Presenter(
                provider: provider,
                currentDate: provider.currentDate()
            )
            let view = ViewController(presenter: presenter)
            presenter.view = view
            return view
        }
        
    }
    
}
