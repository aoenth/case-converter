//
//  PascalCaseToKebabCaseConverterTests.swift
//  
//
//  Created by Kevin Peng on 2022-03-09.
//

import XCTest
@testable import CaseConverter

class PascalCaseToKebabCaseConverterTests: XCTestCase {
    func testSingleUppercaseCharacter() {
        let input = "A"
        let result = PascalCaseToKebabCaseConverter.convertToKebabCase(from: input)
        XCTAssertEqual("a", result)
    }

    func testSingleLowercaseCharacter() {
        let input = "a"
        let result = PascalCaseToKebabCaseConverter.convertToKebabCase(from: input)
        XCTAssertEqual("a", result)
    }

    func testEmptyString() {
        let input = ""
        let result = PascalCaseToKebabCaseConverter.convertToKebabCase(from: input)
        XCTAssertEqual("", result)
    }

    func testNormalPascalCase() {
        let input = "GitStringsFormatter"
        let result = PascalCaseToKebabCaseConverter.convertToKebabCase(from: input)
        XCTAssertEqual("git-strings-formatter", result)
    }
}
