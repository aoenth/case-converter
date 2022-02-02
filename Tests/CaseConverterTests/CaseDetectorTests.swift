//
//  CaseDetectorTests.swift
//  
//
//  Created by Kevin Peng on 2022-02-01.
//

import XCTest
@testable import CaseConverter

final class CaseDetectorTests: XCTestCase {
    func test_kebabCase() {
        let input = "the-quick-brown-fox-jumps-over-the-lazy-dog"
        let result = CaseDetector().detect(input)

        XCTAssertEqual(result, .kebabCase)
    }

    func test_snakeCase() {
        let input = "the_quick_brown_fox_jumps_over_the_lazy_dog"
        let result = CaseDetector().detect(input)

        XCTAssertEqual(result, .snakeCase)
    }

    func test_camelCase() {
        let input = "theQuickBrownFoxJumpsOverTheLazyDog"
        let result = CaseDetector().detect(input)

        XCTAssertEqual(result, .camelCase)
    }

    func test_singleWord() {
        let input = "thequickbrownfoxjumpsoverthelazydog"
        let result = CaseDetector().detect(input)

        XCTAssertEqual(result, .singleWord)
    }

    func test_pascalCase() {
        let input = "TheQuickBrownFoxJumpsOverTheLazyDog"
        let result = CaseDetector().detect(input)

        XCTAssertEqual(result, .pascalCase)
    }

    func test_sentenceCase() {
        let input = "The quick brown fox jumps over the lazy dog"
        let result = CaseDetector().detect(input)

        XCTAssertEqual(result, .sentenceCase)
    }

    func test_titleCase() {
        let input = "The Quick Brown Fox Jumps over the Lazy Dog"
        let result = CaseDetector().detect(input)

        XCTAssertEqual(result, .titleCase)
    }
}
