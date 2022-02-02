//
//  DelimitedCaseToTitleCaseConverter.swift
//  
//
//  Created by Kevin Peng on 2022-01-28.
//

import Foundation

struct DelimitedCaseToTitleCaseConverter {

    static func convertToTitleCase(from input: String, delimiter: String) -> String {
        var input = input
            .replacingOccurrences(of: delimiter + "s" + delimiter, with: "'s ")
            .components(separatedBy: delimiter)
            .map(captalizeIfNeeded)
            .joined(separator: " ")

        for word in String.capitalizationAvoidances {
            if let range = input.lowercased().range(of: " " + word + " ") {
                let replacement = String(input[range]).lowercased()
                input.replaceSubrange(range, with: replacement)
            }
        }

        return input
    }
    
    private static func captalizeIfNeeded(_ word: String) -> String {
        if let foundWord = words(String.capitalizationAvoidances, contain: word) {
            return foundWord
        }
        if let foundWord = words(String.autoCapitalizedWords, contain: word) {
            return foundWord
        }
        return word.capitalized
    }
    
    private static func words(_ words: Set<String>, contain word: String) -> String? {
        words.first(where: { compare(lhs: $0, rhs: word) })
    }
    
    private static func compare(lhs: String, rhs: String) -> Bool {
        lhs.caseInsensitiveCompare(rhs) == .orderedSame
    }
}
