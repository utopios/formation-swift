//
//  MorpionViewModelTests.swift
//  DemoTestTests
//
//  Created by Ihab ABADI on 17/05/2023.
//

import XCTest
@testable import DemoTest

final class MorpionViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_init_cells_should_be_Nine_cells() {
        //Arrange et Act
        let morpionMdel = MorpionModel()
        
        //Assert
        XCTAssertEqual(morpionMdel.grid.count, 9)
    }
    
    func test_init_cells_should_be_Nine_blank_cells() {
        //Arrange et Act
        let morpionMdel = MorpionModel()
        
        //Assert
        XCTAssertEqual(morpionMdel.grid.filter{$0 == cell.s}.count, 9)
    }

}
