//
//  Kofu_GameHub_v2Tests.swift
//  Kofu GameHub v2Tests
//
//  Created by Hendratara Pratama on 01/08/25.
//

import XCTest
@testable import Kofu_GameHub_v2

final class Kofu_GameHub_v2Tests: XCTestCase {
    func testDateFormatter() throws {
        // Arrange
        var dateComponents = DateComponents()
        dateComponents.year = 2025
        dateComponents.month = 8
        dateComponents.day = 14
        let calendar = Calendar(identifier: .gregorian)
        let date = calendar.date(from: dateComponents)!
        
        // Act
        let formatted = date.formatDate("yyyy-MM-dd")
        
        // Assert
        XCTAssertEqual(formatted, "2025-08-14", "Format Date should yyyy-MM-dd")
    }
    
    // MARK: Example
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

}
