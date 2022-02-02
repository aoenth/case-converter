//
//  File.swift
//  
//
//  Created by Kevin Peng on 2022-01-28.
//

import Foundation

enum CaseType {
    case snakeCase
    case kebabCase
    case titleCase
    case sentenceCase
    case spaceSeparated
    case camelCase
    case pascalCase
    case singleWord
}

struct CaseDetector {
    func detect(_ input: String) -> CaseType {
        guard input.count > 0 else {
            return .camelCase
        }
        guard input.count > 1 else {
            return isPascalCase(input: input) ? .pascalCase : .camelCase
        }

        let delimiters = [" ", "_", "-"]

        for delimiter in delimiters {
            let separated = input.components(separatedBy: delimiter)
            if separated.count > 1 {
                switch delimiter {
                case " ":
                    switch isPascalCase(input: separated[0]) {
                    case true:
                        switch separated.filter(\.shouldCapitalizeForTitleCase).isEmpty {
                        case true:
                            return .titleCase
                        case false:
                            return .sentenceCase
                        }
                    case false:
                        return .spaceSeparated
                    }
                case "_":
                    return .snakeCase
                case "-":
                    return .kebabCase
                default:
                    break
                }
            }
        }

        for character in input.dropFirst() {
            if character.isUppercase {
                if isPascalCase(input: input) {
                    return .pascalCase
                } else {
                    return .camelCase
                }
            }
        }

        return .singleWord
    }

    private func isTitleCase(input: [String]) -> Bool {
        for word in input {
            if !word[word.startIndex].isUppercase {
                return false
            }
        }
        return true
    }

    private func isSentenceCase(input: [String]) -> Bool {
        for (index, word) in input.enumerated() {
            if index == 0, word[word.startIndex].isUppercase == false {
                return false
            } else if word[word.startIndex].isLowercase == false {
                return false
            }
        }
        return true
    }

    private func isPascalCase(input: String) -> Bool {
        input[input.startIndex].isUppercase
    }

    private func separate(input: String, delimiter: String) -> [String] {
        input.components(separatedBy: " ")
    }
}
