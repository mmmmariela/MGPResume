import XCTest
@testable import MGPResume

class TestPresenter: XCTestCase, TestingJSON {
    func testPresenterCreation() {
        let navigationPresenter = NavigationPresenter()
        XCTAssertNotNil(navigationPresenter)
        
        let informationPresenter = InformationPresenter()
        XCTAssertNotNil(informationPresenter)
        
        let experiencePresenter = ExperiencePresenter()
        XCTAssertNotNil(experiencePresenter)
    }
    
    func testPresenterCreationFromNavigationPresenter() {
        let navigationPresenter = NavigationPresenter()
        
        let informationPresenter = navigationPresenter.createInformationPresenter()
        XCTAssertNotNil(informationPresenter)
        
        let experiencePresenter = navigationPresenter.createExperiencePresenter(from: informationPresenter)
        
        XCTAssertNotNil(experiencePresenter)
        XCTAssertNil(experiencePresenter.getExperience(at: 0))
    }
    
    func testModelExperienceInjection() {
        guard let mockingSession = createSuccessfulMockingSession() else {
            XCTFail(Failure.createMockFail.rawValue)
            return
        }
        
        let navigationPresenter = NavigationPresenter()
        let informationPresenter = navigationPresenter.createInformationPresenter(mockingSession)

        informationPresenter.setInformation()
        
        let experiencePresenter = navigationPresenter.createExperiencePresenter(from: informationPresenter)
        
        XCTAssertNotNil(experiencePresenter)
        XCTAssertNotNil(experiencePresenter.getExperience(at: 0))
        XCTAssertEqual("Planet Media", experiencePresenter.getExperience(at: 0)?.name)
    }
    
    func testDownloadImage() {
        guard let mockingSession = createSuccessfulMockingSession() else {
            XCTFail(Failure.createMockFail.rawValue)
            return
        }
        
        let navigationPresenter = NavigationPresenter()
        let informationPresenter = navigationPresenter.createInformationPresenter(mockingSession)
        informationPresenter.setInformation()
        
        let experiencePresenter = navigationPresenter.createExperiencePresenter(from: informationPresenter)
        XCTAssertNotNil(experiencePresenter)
        
        let experience = experiencePresenter.getExperience(at: 0)
        XCTAssertNotNil(experience)
        
        experiencePresenter.getImageData(for: experience) { (responseData) in
            XCTAssertNotNil(responseData)
        }
    }
    
    func createSuccessfulMockingSession() -> ApiService? {
        let session = MockingSession()
        let validURL = StaticURL.validURL.rawValue
        let testingJSON = dataFromJSON(file: SourceFile.information.rawValue)
        guard let url = URL(string: validURL) else { return nil }
        session.data = testingJSON
        session.error = nil
        session.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        return ApiService(session: session)
    }
}
