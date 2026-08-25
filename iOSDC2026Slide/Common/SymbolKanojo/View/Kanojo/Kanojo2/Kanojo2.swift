//
//  Kanojo2.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/20.
//

import SwiftUI

/// カノジョ2（仮称）の定義
struct Kanojo2: KanojoPartsProvider {
    let accessoriesViewModel: Kanojo2AccessoriesViewModel
    let faceMaskViewModel: Kanojo2FaceMaskViewModel
    let emotionalEmissionViewModel: Kanojo2EmotionalEmissionViewModel
    let gestureViewModel: Kanojo2GestureViewModel

    var backHair: Kanojo2BackHairView { Kanojo2BackHairView() }
    var bangs: Kanojo2BangsView { Kanojo2BangsView() }
    var face: Kanojo2FaceView { Kanojo2FaceView() }
    var eyebrows: Kanojo2EyebrowsView { Kanojo2EyebrowsView() }
    var eyes: Kanojo2EyesView { Kanojo2EyesView() }
    var mouth: Kanojo2MouthView { Kanojo2MouthView() }
    var costume: Kanojo2CostumeView { Kanojo2CostumeView() }
    var accessories: Kanojo2AccessoriesView { Kanojo2AccessoriesView(vm: accessoriesViewModel) }
    var faceMask: Kanojo2FaceMaskView { Kanojo2FaceMaskView(vm: faceMaskViewModel) }
    var emotionalEmission: Kanojo2EmotionalEmissionView { Kanojo2EmotionalEmissionView(vm: emotionalEmissionViewModel) }
    var gesture: Kanojo2GestureView { Kanojo2GestureView(vm: gestureViewModel) }
}

#Preview {
    KanojoView(
        kanojoParts: Kanojo2(
            accessoriesViewModel: .init(),
            faceMaskViewModel: .init(),
            emotionalEmissionViewModel: .init(),
            gestureViewModel: .init()
        ),
        scale: 1.0,
        isUpsideDown: false
    )
}
