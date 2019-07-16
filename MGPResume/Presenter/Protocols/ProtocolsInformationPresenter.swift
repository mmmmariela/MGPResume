
import Foundation

protocol  InformationPresenterDelegate: AnyObject {
    func informationPersonal(response: InformationResponseModel)
    func errorInWebServices(error: String)
}

protocol InformationPresenterProtocol: class {
    var delegate: InformationPresenterDelegate? { get set }
    func setInformation()
    func getInformation() -> InformationResponseModel?
    func getExperiences() -> [Experience]?
    func getInjectedService() -> ApiService
}

protocol ExperiencePresenterProtocol: class {
    var experienceAmount: Int { get }
    func getExperience(at index: Int) -> Experience?
    func setExperience(_ experiences: [Experience]?)
    func getImageData(for experience: Experience?, completion: @escaping (Data?) -> Void)
}
