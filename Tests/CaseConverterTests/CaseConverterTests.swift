import XCTest
@testable import CaseConverter

final class CaseConverterTests: XCTestCase {
    func test_kebabCaseToTitleCase() throws {
        let input = "boringssl-metrics-log-metric-block-invoke"
        let result = String.spaceSeparatedTitleCase(kebabCase: input)
        let expectation = "Boringssl Metrics Log Metric Block Invoke"
        XCTAssertEqual(result, expectation)
    }
}
