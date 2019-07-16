
import Foundation

protocol ApiServiceProtocol {
    func makeRequest(from path: String, completionHandler:@escaping(_ response: ApiServiceState) -> Void)
}

protocol URLSessionTasking {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionTasking {}

