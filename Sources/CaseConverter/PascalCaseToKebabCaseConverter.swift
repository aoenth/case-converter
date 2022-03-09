//
//  PascalCaseToKebabCaseConverter.swift
//  
//
//  Created by Kevin Peng on 2022-03-09.
//

import Foundation

struct PascalCaseToKebabCaseConverter {
    static func convertToKebabCase(from input: String) -> String {
        var input = Array(input)
        var i = 1
        while i < input.count - 1 {
            if input[i].isUppercase {
                input.insert("-", at: i)
                i += 2
            } else {
                i += 1
            }
        }
        return String(input).lowercased()
    }
}
