import UIKit

protocol WireframeInterface: class {
    func showAlert(with title: String?, message: String?)
    func showProgressHUD()
    func hideProgressHUD()
}

class BaseWireframe {

    private unowned var _viewController: UIViewController
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView.init(activityIndicatorStyle:.gray)
        indicatorView.center = _viewController.view.center
        indicatorView.hidesWhenStopped = true
        _viewController.view.addSubview(indicatorView)
        
        return indicatorView
    }()
    
    //to retain view controller reference upon first access
    private var _temporaryStoredViewController: UIViewController?

    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }

}

extension BaseWireframe: WireframeInterface {
    func showProgressHUD(){
        indicatorView.startAnimating()
    }
    func hideProgressHUD(){
        indicatorView.stopAnimating()
    }
    
    func showAlert(with title: String?, message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        _viewController.present(alertController, animated: true, completion: nil)
    }
}

extension BaseWireframe {
    
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

extension UIViewController {
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (()->())? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
}

extension UINavigationController {
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
}
