import Foundation

// API
public extension String {
    var titleCase: String {
        switch CaseDetector().detect(self) {
        case .kebabCase:
            return KebabCaseToTitleCaseConverter.convertToTitleCase(fromKebabCase: self)
        default:
            fatalError("Conversion unsupported")
        }
    }

    var kebabCase: String {
        switch CaseDetector().detect(self) {
        case .titleCase:
            return TitleCaseToKebabCaseConverter.convertToKebabCase(fromTitleCase: self)
        default:
            fatalError("Conversion unsupported")
        }
    }
}
