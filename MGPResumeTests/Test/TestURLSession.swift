
import XCTest
@testable import MGPResume

class TestURLSession: XCTestCase, TestingJSON {
    //MARK: - Testing for URLSession
    func testNetworkingSessionSuccess() {
        let service: ApiService
        let session = MockingSession()
        session.data = dataFromJSON(file: SourceFile.information.rawValue)
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: Files.correctURL.rawValue), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        
        let expectation = XCTestExpectation(description: ExpectationDescription.testNetworkingSessionSuccess.rawValue)
        service = ApiService(session: session)
        
        service.makeRequest { (response) in
            switch response {
            case .success(data: _):
                expectation.fulfill()
            case .fatal(error: _):
                XCTFail()
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testNetworkingSessionFailureDataNil() {
        let service: ApiService
        let session = MockingSession()
        session.data = nil
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: Files.correctURL.rawValue), statusCode: 200, httpVersion: nil, headerFields: nil)
        
        
        let expectation = XCTestExpectation(description: ExpectationDescription.testNetworkingSessionFailureDataNil.rawValue)
        service = ApiService(session: session)
        
        service.makeRequest { (response) in
            switch response {
            case .success(data: _):
                XCTFail()
            case .fatal(error: _):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testNetworkingSessionFailureBadURL() {
        let service: ApiService
        let session = MockingSession()
        session.data = Data()
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: Files.badURL.rawValue), statusCode: 404, httpVersion: nil, headerFields: nil)
        
        
        let expectation = XCTestExpectation(description: ExpectationDescription.testNetworkingSessionFailureBadURL.rawValue)
        service = ApiService(session: session)
        
        service.makeRequest { (response) in
            switch response {
            case .success(data: _):
                XCTFail()
            case .fatal(error: _):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testNetworkingSessionFailureNoResponse() {
        let service: ApiService
        let session = MockingSession()
        
        let expectation = XCTestExpectation(description: ExpectationDescription.testNetworkingSessionFailureNoResponse.rawValue)
        service = ApiService(session: session)
        
        service.makeRequest { (response) in
            switch response {
            case .success(data: _):
                XCTFail()
            case .fatal(error: _):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
