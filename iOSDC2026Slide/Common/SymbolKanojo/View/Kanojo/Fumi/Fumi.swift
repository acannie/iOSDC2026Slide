//
//  Fumi.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/20.
//

import SwiftUI

/// `符美`の定義
struct Fumi: KanojoPartsProvider {
    let faceViewModel: FumiFaceViewModel
    let eyebrowsViewModel: FumiEyebrowsViewModel
    let eyesViewModel: FumiEyesViewModel
    let mouthViewModel: FumiMouthViewModel
    let costumeViewModel: FumiCostumeViewModel
    let faceMaskViewModel: FumiFaceMaskViewModel
    let accessoriesViewModel: FumiAccessoriesViewModel
    let emotionalEmissionViewModel: FumiEmotionalEmissionViewModel
    let gestureViewModel: FumiGestureViewModel

    var backHair: FumiBackHairView { FumiBackHairView() }
    var bangs: FumiBangsView { FumiBangsView() }
    var face: FumiFaceView { FumiFaceView(vm: faceViewModel) }
    var eyebrows: FumiEyebrowsView { FumiEyebrowsView(vm: eyebrowsViewModel) }
    var eyes: FumiEyesView { FumiEyesView(vm: eyesViewModel) }
    var mouth: FumiMouthView { FumiMouthView(vm: mouthViewModel) }
    var costume: FumiCostumeView { FumiCostumeView(vm: costumeViewModel) }
    var faceMask: FumiFaceMaskView { FumiFaceMaskView(vm: faceMaskViewModel )}
    var accessories: FumiAccessoriesView { FumiAccessoriesView(vm: accessoriesViewModel) }
    var emotionalEmission: FumiEmotionalEmissionView { FumiEmotionalEmissionView(vm: emotionalEmissionViewModel) }
    var gesture: FumiGestureView { FumiGestureView(vm: gestureViewModel) }
}

#Preview {
    KanojoView(
        kanojoParts: Fumi(
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
