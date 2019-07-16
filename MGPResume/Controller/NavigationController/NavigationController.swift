
import UIKit

final class NavigationController: UINavigationController {
    var presenterNavigation: NavigationPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension NavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let controller = viewController as? InformationViewController,
            controller.presenterInformation == nil {
            controller.presenterInformation = presenterNavigation?.createInformationPresenter()
        }

        if let controller = viewController as? ExperienceViewController,
            controller.presenterExperience == nil {
            let informationController = viewControllers.first as? InformationViewController
        
            controller.presenterExperience = presenterNavigation?.createExperiencePresenter(from:
                informationController?.presenterInformation)
        }
    }
}
