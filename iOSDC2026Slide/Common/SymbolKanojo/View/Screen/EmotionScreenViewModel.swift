//
//  EmotionScreenViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/30.
//

import SwiftUI
import Combine

class EmotionScreenViewModel: ObservableObject {
    @Published private(set) var selectedEmotion: Emoticon?

    func selectEmotion(_ emotion: Emoticon) {
        withAnimation(.easeOut(duration: 0.2)) {
            self.selectedEmotion = emotion
        }
    }
}
