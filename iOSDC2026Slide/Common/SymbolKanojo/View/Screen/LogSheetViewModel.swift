//
//  LogSheetViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/10.
//

import SwiftUI
import Combine

class LogSheetViewModel: ObservableObject {
    let dialogueSnapshots: [DialogueSnapshot]

    init(dialogueSnapshots: [DialogueSnapshot]) {
        self.dialogueSnapshots = dialogueSnapshots
    }
}
