import XCTest
@testable import MGPResume

class TestInformationController: XCTestCase {

    func testInformationTableViewExists() {
        let storyboard = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
        guard let informationTableViewController = storyboard.instantiateViewController(withIdentifier: Controller.informationViewController.rawValue) as? InformationViewController else {
            XCTFail(Failure.viewControllerNotFound.rawValue)
            return
        }
        informationTableViewController.loadViewIfNeeded()
        XCTAssertNotNil(informationTableViewController.informationTableView)
    }
    
    func testInformationTableCorrectNumberOfCells() {
        let storyboard = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
        guard let informationViewController = storyboard.instantiateViewController(withIdentifier: Controller.informationViewController.rawValue) as? InformationViewController else {
            XCTFail(Failure.viewControllerNotFound.rawValue)
            return
        }
        informationViewController.loadViewIfNeeded()
        let mockPresenter = MockInformationPresenter()
        mockPresenter.delegate = informationViewController
        informationViewController.presenterInformation = mockPresenter
        mockPresenter.setInformation()
        guard let tableView = informationViewController.informationTableView else {
            XCTFail(Failure.tableViewNotFound.rawValue)
            return
        }
        let rowCount = informationViewController.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, TableInformationViewData.numerOfRowInSection.rawValue)
    }
}
