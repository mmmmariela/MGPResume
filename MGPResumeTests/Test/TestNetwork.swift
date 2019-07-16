
import XCTest
@testable import MGPResume

class TestNetwork: XCTestCase, TestingJSON {
    //MARK: - Testing networking layer
    func testValidURLRequest() {
        let service: ApiService
        let validURL = StaticURL.validURL.rawValue
        guard let url = URL(string: validURL) else { return }
        
        let session = MockingSession()
        session.data = dataFromJSON(file: SourceFile.information.rawValue)
        session.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: ExpectationDescription.testValidURLRequest.rawValue)
        service = ApiService(session: session)
        
        service.makeRequest(from: validURL) { (response) in
            switch response {
            case .success(data: _):
                expectation.fulfill()
            case .fatal(error: _):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testInvalidURLRequest() {
        let service: ApiService
        let invalidURL = StaticURL.invalidURL.rawValue
        guard let url = URL(string: invalidURL) else { return }
        
        let session = MockingSession()
        session.response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: ExpectationDescription.testInvalidURLRequest.rawValue)
        service = ApiService(session: session)
        
        service.makeRequest(from: invalidURL) { (response) in
            switch response {
            case .fatal(error: _):
                expectation.fulfill()
            case .success(data: _):
                XCTFail()            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testNOInternetConnection() {
        let service: ApiService
        let validURL = StaticURL.validURL.rawValue
        guard let url = URL(string: validURL) else { return }
        
        let session = MockingSession()
        session.response = HTTPURLResponse(url: url, statusCode: 0, httpVersion: nil, headerFields: nil)
        
        let expectation = XCTestExpectation(description: ExpectationDescription.testNOInternetConnection.rawValue)
        service = ApiService(session: session)
        
        service.makeRequest(from: validURL) { (response) in
            switch response {
            case .fatal(error: _):
                expectation.fulfill()
            case .success(data: _):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
