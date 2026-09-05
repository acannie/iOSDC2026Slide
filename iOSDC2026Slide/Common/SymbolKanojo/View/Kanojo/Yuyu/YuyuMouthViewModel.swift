//
//  YuyuMouthViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/30.
//

import SwiftUI
import Combine

class YuyuMouthViewModel: MouthViewModel {
    @Published private(set) var expression: MouthType = .smile(.medium, nil)

    func express(_ mouthType: MouthType) {
        withAnimation {
            self.expression = mouthType
        }
    }
}
