//
//  YuyuFaceViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/02.
//

import SwiftUI
import Combine

class YuyuFaceViewModel: FaceViewModel {
    @Published private(set) var faceType: FaceType = .neutral

    func express(_ faceType: FaceType) {
        withAnimation {
            self.faceType = faceType
        }
    }
}
