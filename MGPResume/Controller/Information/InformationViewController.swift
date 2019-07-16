
import UIKit

final class InformationViewController: BaseViewController {
    weak var imgPhoto: UIImageView?
    @IBOutlet weak var informationTableView: UITableView?
    @IBOutlet weak var activity: UIActivityIndicatorView?
    
    var presenterInformation: InformationPresenterProtocol? {
        didSet {
            presenterInformation?.delegate = self
            presenterInformation?.setInformation()
            self.informationTableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NSLocalizedString(Title.information.rawValue, comment: Comment.titleInformation.rawValue)
        configureTableView(informationTableView)
        customize()
    }
    
    // Example code interface creation from constraints
    func customize() {
        guard let informationTableView = informationTableView else {
            fatalError(FatalError.tableViewNotCreated.rawValue);
        }
        
        let avatar = UIImageView(image: #imageLiteral(resourceName: "MyImage"))
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.accessibilityIdentifier = Resources.imagePerfil.rawValue
        view.addSubview(avatar)
        imgPhoto = avatar
        
        avatar.widthAnchor.constraint(equalToConstant: Metrics.imageWidth).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: Metrics.imageHeight).isActive = true
        avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Metrics.topPadding).isActive = true
        avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatar.bottomAnchor.constraint(equalTo: informationTableView.topAnchor, constant: Metrics.bottomPadding).isActive = true
    }
    
    private func configureTableView(_ tableView: UITableView?) {
        guard let informationTableView = tableView else {
            return
        }
        
        activity?.startAnimating()
        informationTableView.delegate = self
        informationTableView.dataSource = self
        informationTableView.register(UINib(nibName: NameOfCells.viewControllerInformation.rawValue, bundle: nil), forCellReuseIdentifier: NameOfCells.viewControllerInformation.rawValue )
    }
}

