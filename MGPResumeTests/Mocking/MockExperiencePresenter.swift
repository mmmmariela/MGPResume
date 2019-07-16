import Foundation
@testable import MGPResume

final class MockExperiencePresenter: ExperiencePresenterProtocol, TestingJSON {
    private var infoExperience: [Experience]?
    var experienceAmount = Int()
    
    func getExperience(at index: Int) -> Experience? {
        return infoExperience?[index]
    }
    
    func setExperience(_ experiences: [Experience]?) {
        guard let numberOfRows = experiences?.count else { return }
        experienceAmount = numberOfRows
        infoExperience = experiences
    }
    
    func getImageData(for experience: Experience?, completion: @escaping (Data?) -> Void) {
        completion(Data())
    }
}
