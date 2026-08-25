//
//  KanojoView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

/// カノジョの共通View
struct KanojoView<KanojoParts: KanojoPartsProvider>: View where
KanojoParts.BackHairType: View,
KanojoParts.BangsType: View,
KanojoParts.FaceType: View,
KanojoParts.EyebrowsType: View,
KanojoParts.EyesType: View,
KanojoParts.MouthType: View,
KanojoParts.FaceMaskType: View,
KanojoParts.CostumeType: View,
KanojoParts.AccessoriesType: View,
KanojoParts.EmotionalEmissionType: View,
KanojoParts.GestureType: View {

    let kanojoParts: KanojoParts
    let scale: CGFloat
    let isUpsideDown: Bool

    var body: some View {
        ZStack {
            kanojoParts.backHair
            kanojoParts.costume
            kanojoParts.face
            kanojoParts.eyebrows
            kanojoParts.eyes
            kanojoParts.mouth
            kanojoParts.faceMask
            kanojoParts.bangs
            kanojoParts.accessories
            kanojoParts.emotionalEmission
            kanojoParts.gesture
        }
        .scaleEffect(scale)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .rotationEffect(.degrees(isUpsideDown ? 180 : 0))
        .offset(y: isUpsideDown ? 1000 * scale : 0)
        .clipped()
        .drawingGroup()
    }
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
        scale: 0.5,
        isUpsideDown: false
    )
}
