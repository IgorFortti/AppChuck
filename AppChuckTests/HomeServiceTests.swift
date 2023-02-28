//
//  HomeServiceTests.swift
//  AppChuckTests
//
//  Created by Igor Fortti on 28/02/23.
//

import XCTest
@testable import AppChuck
import OHHTTPStubs

class HomeServiceTests: XCTestCase {
    
    var homeService: HomeService?

    override func setUpWithError() throws {
        homeService = HomeService()
    }

    override func tearDownWithError() throws {
        homeService = nil
    }

    func testGetHomeSuccess() {
        let expectation = self.expectation(description: "fetch categories")
        homeService?.getHome { result in
            switch result {
            case .success(let success):
                XCTAssertNotNil(success, "Success não pode ser nil")
                expectation.fulfill()
            case .failure:
                XCTFail("A request não pode cair no caso de failure")
            }
        }
        waitForExpectations(timeout: 10)
    }
    
    func testGetHomeFailure() {
        let expectation = self.expectation(description: "fetch categories failure")
        
        HTTPStubs.stubRequests { request in
            request.url?.absoluteString.contains("https://api.chucknorris.io/jokes/categories") ?? false
        } withStubResponse: { _ in
            return HTTPStubsResponse(error: NSError(domain: "com.test.error", code: 404))
        }
        
        homeService?.getHome { result in
            switch result {
            case .success:
                XCTFail("A request não pode cair no caso de success")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10)
        HTTPStubs.removeAllStubs()
    }
}

