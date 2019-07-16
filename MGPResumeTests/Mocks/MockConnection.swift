//
//  MockConnection.swift
//  CV_Miguel_DelgadoTests
//
//  Created by Miguel Angel Delgado Alcantara on 6/28/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//
import Foundation
@testable import CV_Miguel_Delgado

//class MockConnection: MockConnectionProtocol {
//    func successTest(completionHandler: @escaping (ApiServiceState) -> Void) {
//        makeRequest(with: URLSession.shared) { (response) in
//            completionHandler(response)
//        }
//    }

//    func failTest(completionHandler: @escaping (ApiServiceState) -> Void) {
//        completionHandler(.fatal(reason: "No paso"))
//    }

//    func makeRequest(with router: URLSessionTask, completionHandler: @escaping (ApiServiceState) -> Void) {
//        if let path = Bundle.main.path(forResource: "Information", ofType: "json") {
//            do {
//
//                if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe){
//                completionHandler(.success(response: data))
//                }
//            }
//        }
//    }
//}
