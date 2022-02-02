import XCTest
@testable import CaseConverter

protocol CaseConverterTestable {
    var kebabCase: String { get }
    var titleCase: String { get }
    var snakeCase: String { get }
    var sentenceCase: String { get }
    var spaceSeparated: String { get }
    var camelCase: String { get }
    var pascalCase: String { get }
    var singleWord: String { get }
    var allCases: [CaseType: String] { get }
}

extension CaseConverterTestable {
    var allCases: [CaseType: String] {[
        .kebabCase:      kebabCase,
        .titleCase:      titleCase,
        .snakeCase:      snakeCase,
        .sentenceCase:   sentenceCase,
        .spaceSeparated: spaceSeparated,
        .camelCase:      camelCase,
        .pascalCase:     pascalCase,
        .singleWord:     singleWord,
    ]}
}

final class CaseConverterTests: XCTestCase, CaseConverterTestable {

    let kebabCase = "boringssl-on-top-metrics-as-log-when-ipad-metric-as-if-block-invoke"
    let titleCase = "Boringssl on Top Metrics as Log when iPad Metric as if Block Invoke"
    let snakeCase = "boringssl_on_top_metrics_as_log_when_ipad_metric_as_if_block_invoke"
    let sentenceCase = "Boringssl on top metrics as log when iPad metric as if block invoke"
    let spaceSeparated = "boringssl on top metrics as log when iPad metric as if block invoke"
    let camelCase = "boringSSLOnTopMetricsAsLogWheniPadMetricAsIfBlockInvoke"
    let pascalCase = "BoringSSLOnTopMetricsAsLogWheniPadMetricAsIfBlockInvoke"
    let singleWord = "boringsslontopmetricsaslogwhenipadmetricasifblockinvoke"

    func test_allCases() {
        let keyPaths: [CaseType: KeyPath<String, String>] = [
            .kebabCase: \.kebabCase,
            .titleCase: \.titleCase,
            //            .snakeCase: \.snakeCase,
            //            .sentenceCase: \.sentenceCase,
            //            .spaceSeparated: \.spaceSeparated,
            //            .camelCase: \.camelCase,
            //            .pascalCase: \.pascalCase,
            //            .singleWord: \.singleWord,
        ]

        let testCases: [CaseType: KeyPath<CaseConverterTestable, String>] = [
            .kebabCase: \.kebabCase,
            .titleCase: \.titleCase,
            //                .snakeCase: \.snakeCase,
            //                .sentenceCase: \.sentenceCase,
            //                .spaceSeparated: \.spaceSeparated,
            //                .camelCase: \.camelCase,
            //                .pascalCase: \.pascalCase,
            //                .singleWord: \.singleWord,
        ]
        for (source, sourceKeyPath) in testCases {
            for (target, targetKeyPath) in testCases {
                let testCase = "Converting \(source) to \(target)"
                print(testCase)
                let resultKeyPath = keyPaths[target]!
                let result = self[keyPath: sourceKeyPath][keyPath: resultKeyPath]
                let expectation = self[keyPath: targetKeyPath]
                XCTAssertEqual(result, expectation, testCase)
            }
        }
    }
}
