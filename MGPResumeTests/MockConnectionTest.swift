////
////  MockConnection.swift
////  CV_Miguel_DelgadoTests
////
////  Created by Miguel Angel Delgado Alcantara on 6/28/19.
////  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
////
//
//import XCTest
//@testable import CV_Miguel_Delgado
//
//class MockConnectionTest: XCTestCase {
//
//    var connection: MockConnectionProtocol?
//
//    override func setUp() {
//        connection = MockConnection()
//    }
//
//    override func tearDown() {
//        connection = nil
//      }
//
//    func testSucessResponse() {
//        connection?.successTest(completionHandler: { (response) in
//            switch response {
//            case .network:
//                XCTFail()
//            case .notFound:
//                XCTFail()
//            case .fatal:
//                XCTFail()
//            case .success:
//                XCTAssert(true)
//            }
//        })
//    }
//
//    func testFailResponse() {
//        connection?.failTest(completionHandler: { (response) in
//            switch response {
//            case .network:
//                XCTFail()
//            case .notFound:
//                XCTFail()
//            case .fatal:
//                XCTAssert(true)
//            case .success:
//                XCTFail()
//            }
//        })
//    }
//
//    func testSuccessModel() {
//
//        connection?.successTest(completionHandler: { (response) in
//            switch response {
//            case .network:
//                XCTFail()
//            case .notFound:
//                XCTFail()
//            case .fatal:
//                XCTFail()
//            case .success(let data):
//                do {
//                    XCTAssertNoThrow(try JSONDecoder().decode(InformationResponseModel.self, from: data))
//                } catch {
//                    XCTFail()
//                }
//            }
//        })
//    }
//
//    func testCheckValue() {
//        connection?.successTest(completionHandler: { (response) in
//            switch response {
//            case .success(let data):
//                let response = try? JSONDecoder().decode(InformationResponseModel.self, from: data)
//                XCTAssertEqual( response?.name, "Miguel Delgado")
//                XCTAssertEqual(response?.city, "Mexico City")
//                XCTAssertEqual(response?.telephoneNumber, "55-78-78-97-94")
//                XCTAssertEqual(response?.email, "migdelgado@outlook.com")
//                XCTAssertEqual(response?.birthday, "04-12-1993")
//                XCTAssertEqual(response?.objective, "Be part of a company in which I can develop the necessary strategies to contribute to increase your competitiveness")
//             case .network:
//                XCTFail()
//            case .notFound:
//                XCTFail()
//            case .fatal:
//                XCTFail()
//            }
//        })
//    }
//
//}
