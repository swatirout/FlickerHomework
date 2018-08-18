//
//  PhotoViewModelTests.swift
//  FlickerDemoTests
//
//  Created by Swati Rout on 17/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//

import XCTest
@testable import FlickerDemo

class PhotoViewModelTests: XCTestCase {
    var viewmodel:PhotoViewModel?

    override func setUp() {
        super.setUp()
        self.viewmodel = PhotoViewModel()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testnumberOfItemsToDisplay(){
        let result = self.viewmodel?.numberOfItemsToDisplay(in: 0)
        XCTAssertNotNil(result)
    }
    func testurltoshow(){
        let val = self.viewmodel?.urltoshow(for: IndexPath())
        XCTAssertNotNil(val)
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
