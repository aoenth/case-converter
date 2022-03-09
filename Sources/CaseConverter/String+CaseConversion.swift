import Foundation

// API
public extension String {
    var titleCase: String {
        switch CaseDetector().detect(self) {
        case .titleCase:
            return self
        case .singleWord:
            return capitalized
        case .kebabCase:
            return DelimitedCaseToTitleCaseConverter.convertToTitleCase(from: self, delimiter: "-")
        case .snakeCase:
            return DelimitedCaseToTitleCaseConverter.convertToTitleCase(from: self, delimiter: "_")
        default:
            print("Warning: Conversion unsupported")
            return self
        }
    }

    var kebabCase: String {
        switch CaseDetector().detect(self) {
        case .kebabCase:
            return self
        case .singleWord:
            return lowercased()
        case .titleCase, .sentenceCase, .spaceSeparated:
            return TitleCaseToKebabCaseConverter.convertToKebabCase(fromTitleCase: self)
        case .pascalCase:
            return PascalCaseToKebabCaseConverter.convertToKebabCase(from: self)
        default:
            print("Warning: Conversion unsupported")
            return self
        }
    }
}
