//
//  YuyuEmotionalEmissionViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

import SwiftUI
import Combine

class YuyuEmotionalEmissionViewModel: EmotionalEmissionViewModel {
    @Published private(set) var emotionalEmissionType: EmotionalEmissionType = .nothing

    func express(_ emotionalEmissionType: EmotionalEmissionType) {
        withAnimation {
            self.emotionalEmissionType = emotionalEmissionType
        }
    }
}
