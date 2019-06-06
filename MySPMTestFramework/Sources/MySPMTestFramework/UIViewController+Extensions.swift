import UIKit
import SafariServices

// MARK: - Safari Extensions

extension UIViewController: SFSafariViewControllerDelegate {
    
    @available(iOS 9.0, *)
    func presentWebPageInSafari(withURLString URLString: String) {
        guard let url = URL(string: URLString) else{
            return
        }
        
        presentWebPageInSafari(withURL: url)
    }
    
    @available(iOS 9.0, *)
    func presentWebPageInSafari(withURL url: URL) {
        guard UIApplication.shared.canOpenURL(url) else {
            return
        }
        
        let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
        vc.delegate = self
        self.present(vc, animated: true)
    }
    
    @available(iOS 9.0, *)
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Gets top controller

extension UIViewController {
    public static var topController: UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        
        return nil
    }
}
