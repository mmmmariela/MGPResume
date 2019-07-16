
import Foundation

final class ApiService: ApiServiceProtocol {
    private let session: URLSessionTasking
    private var task: URLSessionDataTask?
    
    //MARK: Init Api service
    init(session: URLSessionTasking = URLSession.shared) {
        self.session = session
    }
    
    //MARK: Make a request method
    /**
     Get the data from main url
     
     - parameters:
     - router: A URLSessionTask
     - completitionHandler: A closure that need be defined by the caller to manipulate the data
     */
    func makeRequest(from path: String = Config.setUrlAsString(for: StaticURL.mainURL.rawValue) ?? "", completionHandler:@escaping(_ response: ApiServiceState) -> Void) {
        if let url = URL(string: path) {
            task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == HttpStatusCode.OK.rawValue {
                        if let data = data {
                            completionHandler(.success(data: data))
                        } else {
                            completionHandler(.fatal(error: ApiServiceError.noData))
                        }
                    } else {
                        guard let error = error else {
                            completionHandler(.fatal(error: ApiServiceError.uncategorized))
                            return
                        }
                        completionHandler(.fatal(error: error))
                    }
                } else {
                    guard let error = error else {
                        completionHandler(.fatal(error: ApiServiceError.noResponse))
                        return
                    }
                    completionHandler(.fatal(error: error))
                }
            })
            task?.resume()
        } else {
            completionHandler(.fatal(error: ApiServiceError.badUrl))
        }
    }
}
