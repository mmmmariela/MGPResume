
import XCTest
@testable import MGPResume

protocol TestingJSON {
    func dataFromJSON(file: String) -> Data
}

protocol TestingModel {
    var information: InformationResponseModel {get set}
}

extension TestingJSON where Self: AnyObject {
    func dataFromJSON(file: String) -> Data {
        guard let url = Bundle(for: type(of: self)).url(forResource: file, withExtension: TypeFile.json.rawValue) else { return Data() }
        guard let data  = try? Data(contentsOf: url) else { return Data()}
        return data
    }
}
