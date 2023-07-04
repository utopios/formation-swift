//
//  MorpionViewModelTests.swift
//  DemoTestTests
//
//  Created by Ihab ABADI on 17/05/2023.
//

import XCTest
@testable import DemoTest

final class MorpionViewModelTests: XCTestCase {
    private var _morpionModel: MorpionModel = MorpionModel()
    override func setUpWithError() throws {
        _morpionModel = MorpionModel()
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
        //let morpionMdel = MorpionModel()
        
        //Assert
        XCTAssertEqual(_morpionModel.grid.count, 9)
    }
    
    func test_init_cells_should_be_Nine_blank_cells() {
        //Arrange et Act
        //let morpionMdel = MorpionModel()
        
        //Assert
        XCTAssertEqual(_morpionModel.grid.filter{$0 == cell.s}.count, 9)
    }
    
    func test_set_cell_with_correct_value_should_be_filled_correcty() {
        //Act
        _morpionModel.setCell(n: 3, c: .x)
        
        XCTAssertEqual(_morpionModel.grid[2], cell.x)
    }
    
    func test_set_cell_with_wrong_value_should_not_be_filled() throws {
        //Act
        let result =  _morpionModel.setCell(n: 10, c: .x)
        XCTAssertFalse(result)
    }
    
    func test_set_cell_with_wrong_same_cell_twice_should_not_be_filled() throws {
        //Act
        _morpionModel.setCell(n: 3, c: .x)
        _morpionModel.setCell(n: 3, c: .o)
        let result =  _morpionModel.setCell(n: 10, c: .x)
        XCTAssertFalse(result)
    }

}
