
import UIKit

class ExperienceViewController: BaseViewController {
    @IBOutlet weak var experienceTableView: UITableView?
    var presenterExperience: ExperiencePresenterProtocol? {
        didSet {
            self.experienceTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView(experienceTableView)
        
        navigationItem.title = NSLocalizedString(Title.experience.rawValue, comment: Comment.titleExperience.rawValue)
    }
    
    private func configureTableView(_ tableView: UITableView?) {
        guard let tableView = tableView else {
            return
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: NameOfCells.viewExperience.rawValue, bundle: nil),
                           forCellReuseIdentifier: NameOfCells.viewExperience.rawValue )
    }
}

