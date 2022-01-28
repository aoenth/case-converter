import XCTest
@testable import CaseConverter

final class CaseConverterTests: XCTestCase {
    func test_kebabCaseToTitleCase() {
        let input = "boringssl-metrics-log-metric-block-invoke"
        let result = input.titleCase
        let expectation = "Boringssl Metrics Log Metric Block Invoke"
        XCTAssertEqual(result, expectation)
    }

    func test_kebabCaseToTitleCaseWithNonCapitalizedWords() {
        let input = "boringssl-on-top-metrics-as-log-when-iPad-metric-as-if-block-invoke"
        let result = input.titleCase
        let expectation = "Boringssl on Top Metrics as Log when iPad Metric as if Block Invoke"
        XCTAssertEqual(result, expectation)
    }

    func test_titleCaseToKebabCase() {
        let input = "Boringssl Metrics Log Metric Block Invoke"
        let result = input.kebabCase
        let expectation = "boringssl-metrics-log-metric-block-invoke"
        XCTAssertEqual(result, expectation)
    }
}
