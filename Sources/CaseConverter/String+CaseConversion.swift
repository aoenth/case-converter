import Foundation

// API
public extension String {
    var titleCase: String {
        switch CaseDetector().detect(self) {
        case .singleWord:
            return capitalized
        case .kebabCase:
            return DelimitedCaseToTitleCaseConverter.convertToTitleCase(from: self, delimiter: "-")
        case .snakeCase:
            return DelimitedCaseToTitleCaseConverter.convertToTitleCase(from: self, delimiter: "_")
        default:
            fatalError("Conversion unsupported")
        }
    }

    var kebabCase: String {
        switch CaseDetector().detect(self) {
        case .singleWord:
            return lowercased()
        case .titleCase, .sentenceCase, .spaceSeparated:
            return TitleCaseToKebabCaseConverter.convertToKebabCase(fromTitleCase: self)
        default:
            fatalError("Conversion unsupported")
        }
    }
}
