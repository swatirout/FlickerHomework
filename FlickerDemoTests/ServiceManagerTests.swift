//
//  ServiceManagerTests.swift
//  FlickerDemoTests
//
//  Created by Swati Rout on 16/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//

import XCTest
@testable import FlickerDemo

class ServiceManagerTests: XCTestCase {
    var manager:ServiceManager?
    
    override func setUp() {
        super.setUp()
        self.manager = ServiceManager()


        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testUserData() {
        guard let userUrl = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3e7cc266ae2b0e0d78e279ce8e361736& format=json&nojsoncallback=1&safe_search=1&text=kittens") else { return }
        let promise = expectation(description: "Simple Request")
        URLSession.shared.dataTask(with: userUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let result = json as? NSDictionary {
                    XCTAssertNotNil(result)
                    promise.fulfill()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
