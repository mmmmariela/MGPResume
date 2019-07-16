import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: Controller.navigationController.rawValue) as? NavigationController
        navigationController?.presenterNavigation = NavigationPresenter()

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        return true
    }
}
