
import UIKit

class BaseViewController: UIViewController {
    var contentView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBase()
    }
    
    private func configBase() {
        let imageBackground = UIImage(named: NameOfImage.imgBackgroundScreen.rawValue)
        
        contentView = UIImageView(image: imageBackground)
        contentView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let content = contentView {
            content.alpha = CGFloat(BaseData.alphaNum.rawValue)
            view.insertSubview(content, at: TableInformationViewData.numeroOfOptional.rawValue)
            content.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            content.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            content.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            content.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        }
    }
}

