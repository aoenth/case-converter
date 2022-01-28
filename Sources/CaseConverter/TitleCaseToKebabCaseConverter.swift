//
//  TitleCaseToKebabCaseConverter.swift
//  
//
//  Created by Kevin Peng on 2022-01-28.
//

import Foundation

struct TitleCaseToKebabCaseConverter {
    static func convertToKebabCase(fromTitleCase input: String) -> String {
        input
            .components(separatedBy: " ")
            .map(\.localizedLowercase)
            .joined(separator: "-")
    }
}
