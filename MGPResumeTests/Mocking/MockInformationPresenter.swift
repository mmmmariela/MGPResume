import Foundation
@testable import MGPResume

final class MockInformationPresenter: InformationPresenterProtocol, TestingJSON {
    weak var delegate: InformationPresenterDelegate?
    private var responseInfo: InformationResponseModel?
    
    func setInformation() {
        let data = dataFromJSON(file: SourceFile.information.rawValue)
        guard let dummyInfo = try? JSONDecoder().decode(InformationResponseModel.self, from: data) else { return }
        delegate?.informationPersonal(response: dummyInfo)
    }
    
    func getInformation() -> InformationResponseModel? {
        return responseInfo
    }
    
    func getExperiences() -> [Experience]? {
        return getInformation()?.experience
    }
    
    func getInjectedService() -> ApiService {
        return ApiService()
    }
}
