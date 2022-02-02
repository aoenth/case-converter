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
            return input.isCapitalized ? .pascalCase : .camelCase
        }

        let delimiters = [" ", "_", "-"]

        for delimiter in delimiters {
            let separated = input.components(separatedBy: delimiter)
            if separated.count > 1 {
                switch delimiter {
                case " ":
                    guard separated[0].isCapitalized else { return .sentenceCase }
                    for word in separated.dropFirst() {
                        if word.isCapitalized == false && !word.isLowercaseInTitleCase {
                            return .sentenceCase
                        }
                    }
                    return .titleCase
                case "_":
                    return .snakeCase
                case "-":
                    return .kebabCase
                default:
                    break
                }
            }
        }

        for (index, character) in input.enumerated() {
            if character.isUppercase {
                if index == 0 {
                    return .pascalCase
                } else {
                    return .camelCase
                }
            }
        }

        return .singleWord
    }
}

extension String {
    var isCapitalized: Bool {
        self[startIndex].isUppercase
    }
}
