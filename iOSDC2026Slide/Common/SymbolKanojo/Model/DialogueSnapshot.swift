//
//  DialogueSnapshot.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/06.
//

import SwiftUI

struct DialogueSnapshot: Hashable {
    struct CharacterAppearance: Hashable {
        let character: Character
        let expression: Expression
    }
    let characters: [CharacterAppearance]
    let dialogue: String
    let activeCharacter: Character

    init(
        characters: [CharacterAppearance],
        dialogue: String,
        activeCharacter: Character
    ) {
        self.characters = characters
        self.dialogue = dialogue
        self.activeCharacter = activeCharacter
    }
}
