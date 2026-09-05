//
//  Yuyu.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/20.
//

import SwiftUI

struct Yuyu: KanojoPartsProvider {
    let faceViewModel: YuyuFaceViewModel
    let eyebrowsViewModel: YuyuEyebrowsViewModel
    let eyesViewModel: YuyuEyesViewModel
    let mouthViewModel: YuyuMouthViewModel
    let costumeViewModel: YuyuCostumeViewModel
    let faceMaskViewModel: YuyuFaceMaskViewModel
    let accessoriesViewModel: YuyuAccessoriesViewModel
    let emotionalEmissionViewModel: YuyuEmotionalEmissionViewModel
    let gestureViewModel: YuyuGestureViewModel

    var backHair: YuyuBackHairView { YuyuBackHairView() }
    var bangs: YuyuBangsView { YuyuBangsView() }
    var face: YuyuFaceView { YuyuFaceView(vm: faceViewModel) }
    var eyebrows: YuyuEyebrowsView { YuyuEyebrowsView(vm: eyebrowsViewModel) }
    var eyes: YuyuEyesView { YuyuEyesView(vm: eyesViewModel) }
    var mouth: YuyuMouthView { YuyuMouthView(vm: mouthViewModel) }
    var costume: YuyuCostumeView { YuyuCostumeView(vm: costumeViewModel) }
    var faceMask: YuyuFaceMaskView { YuyuFaceMaskView(vm: faceMaskViewModel )}
    var accessories: YuyuAccessoriesView { YuyuAccessoriesView(vm: accessoriesViewModel) }
    var emotionalEmission: YuyuEmotionalEmissionView { YuyuEmotionalEmissionView(vm: emotionalEmissionViewModel) }
    var gesture: YuyuGestureView { YuyuGestureView(vm: gestureViewModel) }
}

#Preview {
    KanojoView(
        kanojoParts: Yuyu(
            faceViewModel: .init(),
            eyebrowsViewModel: .init(),
            eyesViewModel: .init(),
            mouthViewModel: .init(),
            costumeViewModel: .init(),
            faceMaskViewModel: .init(),
            accessoriesViewModel: .init(),
            emotionalEmissionViewModel: .init(),
            gestureViewModel: .init()
        ),
        scale: 1.0,
        isUpsideDown: false
    )
}
