//
//  CustomLayOutTests.swift
//  FlickerDemoTests
//
//  Created by Swati Rout on 16/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//

import XCTest
@testable import FlickerDemo

class CustomLayOutTests: XCTestCase {
    var layOut:CustomLayOut?

    override func setUp() {
        super.setUp()
        self.layOut = CustomLayOut(numberOfColumns: 3)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testtargetContentOffset(){
        self.layOut?.targetContentOffset(forProposedContentOffset: CGPoint(x: 0.0, y: 0.0))
    }
    func testAllVariables(){
        XCTAssertNotNil(self.layOut?.itemSize)
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
