//
//  FumiEyesViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/30.
//

import SwiftUI
import Combine

class FumiEyesViewModel: EyesViewModel {
    @Published private(set) var leftEyeType: EyeType = .normal(.neutral, .normal, .center)
    @Published private(set) var rightEyeType: EyeType = .normal(.neutral, .normal, .center)

    func express(_ eyeType: EyeType) {
        withAnimation {
            self.leftEyeType = eyeType
            self.rightEyeType = eyeType
        }
    }

    func express(left leftEyeType: EyeType, right rightEyeType: EyeType) {
        withAnimation {
            self.leftEyeType = leftEyeType
            self.rightEyeType = rightEyeType
        }
    }
}
