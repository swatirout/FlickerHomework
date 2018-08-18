//
//  ViewControllerTests.swift
//  FlickerDemoTests
//
//  Created by Swati Rout on 15/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//

import XCTest
@testable import FlickerDemo

class ViewControllerTests: XCTestCase {
    var VC:ViewController?
    var photuViewModel : PhotoViewModel?

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.VC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
        UIApplication.shared.keyWindow!.rootViewController = self.VC
        photuViewModel = PhotoViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testViewDidLoad() {
        DispatchQueue.main.async {
            self.VC?.viewDidLoad()
        }
    }
    func testDidReceiveMemory() {
        DispatchQueue.main.async {
            self.VC?.didReceiveMemoryWarning()
        }
    }
    
    func testSUT_ShouldSetSearchBarDelegate() {
        
        XCTAssertNotNil(self.VC?.searchBar.delegate)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
}
