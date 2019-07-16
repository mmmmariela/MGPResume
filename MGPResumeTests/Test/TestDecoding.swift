
import XCTest
@testable import MGPResume

class TestDecoding: XCTestCase, TestingJSON {
    //MARK: Parse method testing
    func testParseDataFromValidJSON() {
        var parseData: InformationResponseModel?
        let data = dataFromJSON(file: SourceFile.information.rawValue)
        parseData = try? JSONDecoder().decode(InformationResponseModel.self, from: data)
        XCTAssertNotNil(parseData)
    }
    
    func testParseDataFromInvalidJSON() {
        var parseData: InformationResponseModel?
        let data = dataFromJSON(file: SourceFile.corruptInformation.rawValue)
        parseData = try? JSONDecoder().decode(InformationResponseModel.self, from: data)
        XCTAssertNil(parseData)
    }
    
    func testParseDataNil() {
        var parseData: InformationResponseModel?
        let data = Data()
        parseData = try? JSONDecoder().decode(InformationResponseModel.self, from: data)
        XCTAssertNil(parseData)
    }
}
