import Foundation

public extension String {
    private static let autoCapitalizedWords: Set<String> = [
        "iOS",
        "macOS",
        "tvOS",
        "iPadOS",
        "iPhone",
        "iPad",
        "MacBook",
    ]

    private static let capitalizationAvoidances: Set<String> = [
        "and",
        "as",
        "as if",
        "as long as",
        "at",
        "but",
        "by",
        "even if",
        "for",
        "from",
        "if",
        "if only",
        "in",
        "into",
        "like",
        "near",
        "now that",
        "nor",
        "of",
        "off",
        "on",
        "on top of",
        "once",
        "onto",
        "or",
        "out of",
        "over",
        "past",
        "so",
        "so that",
        "than",
        "that",
        "till",
        "to",
        "up",
        "upon",
        "with",
        "when",
        "yet",
    ]

    static func spaceSeparatedTitleCase(kebabCase: String) -> String {
        kebabCase
            .replacingOccurrences(of: "-s-", with: "'s ")
            .components(separatedBy: "-")
            .map(captalizeIfNeeded)
            .joined(separator: " ")
    }

    static func captalizeIfNeeded(_ word: String) -> String {
        if let foundWord = words(Self.capitalizationAvoidances, contain: word) {
            return foundWord
        }
        if let foundWord = words(Self.autoCapitalizedWords, contain: word) {
            return foundWord
        }
        return word.capitalized
    }

    static func words(_ words: Set<String>, contain word: String) -> String? {
        words.first(where: { compare(lhs: $0, rhs: word) })
    }

    static func compare(lhs: String, rhs: String) -> Bool {
        lhs.caseInsensitiveCompare(rhs) == .orderedSame
    }
}
