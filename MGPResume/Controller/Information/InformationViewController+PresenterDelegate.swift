import UIKit

extension InformationViewController: InformationPresenterDelegate {
    func errorInWebServices(error: String) {
        showAlertError(error: error)
    }
    
    func informationPersonal(response: InformationResponseModel) {
        DispatchQueue.main.async { [weak self] in
            self?.activity?.isHidden = true
            self?.informationTableView?.reloadData()
        }
    }
    
    func showAlertError(error: String) {
        let alert = UIAlertController(title: NSLocalizedString(AlertError.error.rawValue, comment: Comment.error.rawValue), message: NSLocalizedString(error, comment: Comment.messageError.rawValue), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(AlertError.accept.rawValue, comment: Comment.accept.rawValue), style: .default, handler: { [weak self] action in
            self?.activity?.isHidden = false
            self?.presenterInformation?.setInformation()
        }))
        
        self.present(alert, animated: true)
    }
}
