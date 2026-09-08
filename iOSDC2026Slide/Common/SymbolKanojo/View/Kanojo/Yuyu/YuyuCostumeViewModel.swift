//
//  YuyuCostumeViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/06.
//

import SwiftUI
import Combine

class YuyuCostumeViewModel: CostumeViewModel {
    @Published private(set) var costumeType: CostumeType = .normal(.normal)

    func express(_ costumeType: CostumeType) {
        withAnimation {
            self.costumeType = costumeType
        }
    }
}
