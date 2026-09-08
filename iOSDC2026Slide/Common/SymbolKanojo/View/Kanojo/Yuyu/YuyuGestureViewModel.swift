//
//  YuyuGestureViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

import SwiftUI
import Combine

class YuyuGestureViewModel: GestureViewModel {
    @Published private(set) var leftHandGestureType: GestureType = .backhandOutFront(.normal)
    @Published private(set) var rightHandGestureType: GestureType = .backhandOutFront(.normal)
    @Published private(set) var costumeType: CostumeType = .normal(.normal)

    func express(left leftHandGestureType: GestureType, right rightHandGestureType: GestureType, costumeType: CostumeType) {
        withAnimation {
            self.leftHandGestureType = leftHandGestureType
            self.rightHandGestureType = rightHandGestureType
            self.costumeType = costumeType
        }
    }
}
