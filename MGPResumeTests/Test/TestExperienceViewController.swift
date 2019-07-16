
import XCTest
@testable import MGPResume

class TestExperienceViewController: XCTestCase, TestingJSON {
    
    func testExperienceTableViewExists() {
        let storyboard = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
        guard let experienceViewController = storyboard.instantiateViewController(withIdentifier: Controller.experinceViewController.rawValue) as? ExperienceViewController else {
            XCTFail(Failure.viewControllerNotFound.rawValue)
            return
        }
        experienceViewController.loadViewIfNeeded()
        XCTAssertNotNil(experienceViewController.experienceTableView)
    }
    
    func testExperienceTableCorrectNumberOfCells() {
        let storyboard = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
        guard let experienceViewController = storyboard.instantiateViewController(withIdentifier: Controller.experinceViewController.rawValue) as? ExperienceViewController else {
            XCTFail(Failure.viewControllerNotFound.rawValue)
            return
        }
        let data = dataFromJSON(file: SourceFile.information.rawValue)
        guard let dummyInfo = try? JSONDecoder().decode(InformationResponseModel.self, from: data) else { return }

        let mockPresenter = MockExperiencePresenter()
        mockPresenter.setExperience(dummyInfo.experience)

        experienceViewController.loadViewIfNeeded()

        experienceViewController.presenterExperience = mockPresenter

        guard let tableView = experienceViewController.experienceTableView else {
            XCTFail(Failure.tableViewNotFound.rawValue)
            return
        }
        let rowCount = experienceViewController.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, dummyInfo.experience?.count)
    }
    
    func testExperienceTableCorrectNumberOfCellsWithEmptyData() {
        let storyboard = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
        guard let experienceViewController = storyboard.instantiateViewController(withIdentifier: Controller.experinceViewController.rawValue) as? ExperienceViewController else {
            XCTFail(Failure.viewControllerNotFound.rawValue)
            return
        }
        let data = Data()
        guard let dummyInfo = try? JSONDecoder().decode(InformationResponseModel.self, from: data) else { return }
        
        let mockPresenter = MockExperiencePresenter()
        mockPresenter.setExperience(dummyInfo.experience)
        
        experienceViewController.loadViewIfNeeded()
        
        experienceViewController.presenterExperience = mockPresenter
        
        guard let tableView = experienceViewController.experienceTableView else {
            XCTFail(Failure.tableViewNotFound.rawValue)
            return
        }
        let rowCount = experienceViewController.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, dummyInfo.experience?.count)
    }
    
    func testCorrectInformationAtCells() {
        let storyboard = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
        guard let experienceViewController = storyboard.instantiateViewController(withIdentifier: Controller.experinceViewController.rawValue) as? ExperienceViewController else {
            XCTFail(Failure.viewControllerNotFound.rawValue)
            return
        }
        let data = dataFromJSON(file: SourceFile.information.rawValue)
        guard let dummyInfo = try? JSONDecoder().decode(InformationResponseModel.self, from: data) else { return }
        
        let mockPresenter = MockExperiencePresenter()
        let experience = dummyInfo.experience
        mockPresenter.setExperience(experience)
        
        experienceViewController.loadViewIfNeeded()
        
        experienceViewController.presenterExperience = mockPresenter
        
        guard let tableView = experienceViewController.experienceTableView else {
            XCTFail(Failure.tableViewNotFound.rawValue)
            return
        }
        let rowCount = experienceViewController.tableView(tableView, numberOfRowsInSection: 0)
        
        for idx in 0..<rowCount {
            let indexPath = IndexPath(row: idx, section: 0)
            guard let cell = experienceViewController.tableView(tableView, cellForRowAt: indexPath) as? ExperienceTableViewCell else {
                XCTFail()
                return
            }
            XCTAssertEqual(cell.lbName?.text, experience?[idx].name)
            XCTAssertEqual(cell.lbDate?.text, experience?[idx].date)
            XCTAssertEqual(cell.lbRole?.text, experience?[idx].role)
            XCTAssertEqual(cell.lbDescription?.text, experience?[idx].descripcion)
        }
    }
}
