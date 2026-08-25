//
//  TalkScreenViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/06.
//

import SwiftUI
import Combine

class TalkScreenViewModel: ObservableObject {
    private let dialogueSnapshots = ScenarioGreeting.dialogueSnapshots
    @Published private(set) var currentDialogueIndex: Int = 0
    @Published private(set) var isFullScreenMode = false
    @Published var finishedTypewriting = false
    @Published var showsLogSheet = false

    var currentDialogueSnapshot: DialogueSnapshot {
        dialogueSnapshots[currentDialogueIndex]
    }

    var dialogueLog: [DialogueSnapshot] {
        Array(dialogueSnapshots.prefix(currentDialogueIndex + 1))
    }

    func proceedDialogue(_ action: @escaping () -> Void, endAction: @escaping () -> Void) {
        updateFinishedTypewriting(to: false)
        let newIndex = currentDialogueIndex + 1
        if newIndex < dialogueSnapshots.count {
            currentDialogueIndex = newIndex
            action()
        } else {
            endAction()
        }
    }

    func updateFullScreenMode(to isFullScreenMode: Bool) {
        withAnimation(.easeInOut(duration: 0.5)) {
            self.isFullScreenMode = isFullScreenMode
        }
    }

    func updateFinishedTypewriting(to finishedTypewriting: Bool) {
        self.finishedTypewriting = finishedTypewriting
    }

    func showLogSheet() {
        self.showsLogSheet = true
    }
}
