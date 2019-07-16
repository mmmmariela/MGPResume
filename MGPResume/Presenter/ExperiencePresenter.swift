
import Foundation

final class ExperiencePresenter: ExperiencePresenterProtocol {    
    private var infoExperience: [Experience]?
    private let service: ApiService
    
    init(service: ApiService = ApiService()) {
        self.service = service
    }
    
    var experienceAmount: Int {
        return infoExperience?.count ?? 0
    }
    
    func getExperience(at index: Int) -> Experience? {
        return infoExperience?[index]
    }
    
    func setExperience(_ experiences: [Experience]?) {
        self.infoExperience = experiences
    }
    
    func getImageData(for experience: Experience?, completion: @escaping (Data?) -> Void) {
        guard let experience = experience else {
            return completion(nil)
        }
        
        InfoHelper(service).getDownloadImg(urlImage: experience.image) { (responseData) in
            switch responseData {
            case .success(let data):
                DispatchQueue.main.async() {
                    completion(data)
                }
                break
            default:
                break
            }
        }
    }
}

