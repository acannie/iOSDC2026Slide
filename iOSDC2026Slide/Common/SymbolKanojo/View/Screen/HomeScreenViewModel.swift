//
//  HomeScreenViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/05.
//

import SwiftUI
import Combine

class HomeScreenViewModel: ObservableObject {
    @Published private(set) var dialogue: String = ""

    func updateDialogue(_ dialogue: String) {
        withAnimation(.easeIn(duration: 0.5)) {
            self.dialogue = dialogue
        }
    }
}
