
import UIKit

final class ExperienceTableViewCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel?
    @IBOutlet weak var lbDate: UILabel?
    @IBOutlet weak var lbRole: UILabel?
    @IBOutlet weak var lbDescription: UILabel?
    @IBOutlet weak var img: UIImageView?

    func updateUI(infoExperience: Experience) {
        self.lbName?.text = infoExperience.name
        self.lbDate?.text = infoExperience.date
        self.lbRole?.text = infoExperience.role
        self.lbDescription?.text = infoExperience.descripcion
    }
    
    func setImage(_ image: UIImage) {
        self.img?.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.img?.image = nil
    }
}
