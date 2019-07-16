
import Foundation

final class InfoHelper: NSObject {
    private let service: ApiService
    
    init(_ service: ApiService = ApiService()) {
        self.service = service
    }
    
    //MARK: My info method
    /**
     Get a DownloadResult
     
     - parameters:
     - completionHandler: A closure that need be defined by the caller to manipulate the data
     */
    func getInfo(completionHandler: @escaping(ApiServiceState) -> Void) {
        service.makeRequest { (response) in
            switch response {
            case .success(let data):
                completionHandler(.success(data:data))
            case .fatal(let fatal):
                completionHandler(.fatal(error: fatal))
            }
        }
    }
    
    func getDownloadImg(urlImage: String, completionHandler: @escaping(ApiServiceState) -> Void){
        service.makeRequest(from: urlImage) { (response) in
            switch response {
            case .success(let data):
                completionHandler(.success(data:data))
            case .fatal(let fatal):
                completionHandler(.fatal(error: fatal))
            }
        }
    }
}
