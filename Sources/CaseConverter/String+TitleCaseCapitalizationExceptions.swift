//
//  File.swift
//  
//
//  Created by Kevin Peng on 2022-02-01.
//

import Foundation

extension String {

    var isLowercaseInTitleCase: Bool {
        Self.capitalizationAvoidances.contains(self)
    }

    static let capitalizationAvoidances: Set<String> = [
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
        "the",
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

    static let autoCapitalizedWords: Set<String> = [
        "iOS",
        "macOS",
        "tvOS",
        "iPadOS",
        "iPhone",
        "iPad",
        "MacBook",
        "VoiceOver",
    ]
}
