//
//  Character.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/06.
//

enum Character: Hashable {
    case fumi
    case kanojo2

    var name: String {
        switch self {
        case .fumi:
            "符美"
        case .kanojo2:
            "Kanojo2"
        }
    }

    func dialogue(of emoticon: Emoticon) -> String {
        switch self {
        case .fumi:
            fumiDialogue(of: emoticon)
        case .kanojo2:
            ""
        }
    }
}
