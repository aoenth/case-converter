import Foundation

// API
public extension String {
    var titleCase: String {
        switch CaseDetector().detect(self) {
        case .singleWord:
            return capitalized
        case .kebabCase:
            return KebabCaseToTitleCaseConverter.convertToTitleCase(fromKebabCase: self)
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
