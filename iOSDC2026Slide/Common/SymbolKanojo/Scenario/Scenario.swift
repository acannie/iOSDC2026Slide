//
//  Scenario.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/06.
//

enum ScenarioSection {
    case greeting

    var dialogueSnapshots: [DialogueSnapshot] {
        switch self {
        case .greeting:
            ScenarioGreeting.dialogueSnapshots
        }
    }
}
