//
//  ExtensionsTest.swift
//  Kofu GameHub v2 - Tests
//
//  Created by Hendratara Pratama on 14/08/25.
//

import XCTest
@testable import Kofu_GameHub_v2

final class ExtensionTest: XCTestCase {
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
    
    func testEmptyString() throws {
        // Arrange
        let text: String = "Hello World!"
        
        // Act
        let isNotEmpty = text.isNotEmpty
        
        // Assert
        XCTAssertTrue(isNotEmpty)
    }
}

