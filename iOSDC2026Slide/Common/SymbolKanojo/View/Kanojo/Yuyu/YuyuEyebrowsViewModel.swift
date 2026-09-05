//
//  YuyuEyebrowsViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/30.
//

import SwiftUI
import Combine

class YuyuEyebrowsViewModel: EyebrowsViewModel {
    @Published private(set) var leftEyebrowType: EyebrowType = .neutral
    @Published private(set) var rightEyebrowType: EyebrowType = .neutral

    func express(_ eyebrowType: EyebrowType) {
        withAnimation {
            self.rightEyebrowType = eyebrowType
            self.leftEyebrowType = eyebrowType
        }
    }

    func express(left leftEyebrowType: EyebrowType, right rightEyebrowType: EyebrowType) {
        withAnimation {
            self.rightEyebrowType = leftEyebrowType
            self.leftEyebrowType = rightEyebrowType
        }
    }
}
