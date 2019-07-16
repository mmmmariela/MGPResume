
import Foundation

final class InformationPresenter: InformationPresenterProtocol {    
    weak var delegate: InformationPresenterDelegate?
    private var responseInfo: InformationResponseModel?
    private var service: ApiService
    
    init(_ service: ApiService = ApiService()) {
        self.service = service
    }
    
    func setInformation() {
        InfoHelper(service).getInfo { [weak self] (responseData) in
            switch responseData {
            case .success(let dataResponse):
                if let myInfo = try? JSONDecoder().decode(InformationResponseModel.self, from: dataResponse) {
                    self?.responseInfo = myInfo
                    self?.delegate?.informationPersonal(response: myInfo)
                }
            case .fatal:
                self?.delegate?.errorInWebServices(error: AlertError.again.rawValue)
            }
        }
    }
    
    func getInformation() -> InformationResponseModel? {
        return responseInfo
    }
    
    func getExperiences() -> [Experience]? {
        return getInformation()?.experience
    }
    
    func getInjectedService() -> ApiService {
        return service
    }
}

