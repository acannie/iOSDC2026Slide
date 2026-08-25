//
//  FumiViewModel.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/30.
//

import SwiftUI
import Combine

class FumiViewModel: KanojoViewModel {
    @Published private(set) var activeAction: ActionType? = nil

    let faceVM = FumiFaceViewModel()
    let eyebrowsVM = FumiEyebrowsViewModel()
    let eyesVM = FumiEyesViewModel()
    let mouthVM = FumiMouthViewModel()
    let costumeVM = FumiCostumeViewModel()
    let faceMaskVM = FumiFaceMaskViewModel()
    let accessoriesVM = FumiAccessoriesViewModel()
    let emotionalEmissionVM = FumiEmotionalEmissionViewModel()
    let gestureVM = FumiGestureViewModel()

    lazy var parts: some KanojoPartsProvider = Fumi(
        faceViewModel: faceVM,
        eyebrowsViewModel: eyebrowsVM,
        eyesViewModel: eyesVM,
        mouthViewModel: mouthVM,
        costumeViewModel: costumeVM,
        faceMaskViewModel: faceMaskVM,
        accessoriesViewModel: accessoriesVM,
        emotionalEmissionViewModel: emotionalEmissionVM,
        gestureViewModel: gestureVM
    )

    func express(_ emoticonType: Emoticon) {
        express(emoticonType.expression)
    }

    func express(_ expression: Expression) {
        faceVM.express(expression.faceType)
        eyebrowsVM.express(left: expression.leftEyebrowType, right: expression.rightEyebrowType)
        eyesVM.express(left: expression.leftEyeType, right: expression.rightEyeType)
        mouthVM.express(expression.mouthType)
        costumeVM.express(expression.costumeType)
        faceMaskVM.express(expression.faceMaskType)
        accessoriesVM.put(expression.accessoriesType)
        emotionalEmissionVM.express(expression.emotionalEmissionType)
        gestureVM.express(left: expression.leftHandGestureType, right: expression.rightHandGestureType, costumeType: expression.costumeType)
        self.action(expression.actionType)
    }
}

private extension FumiViewModel {
    func action(_ actionType: ActionType) {
        switch actionType {
        case .fade, .nothing:
            withAnimation {
                activeAction = actionType
            }
        case .shake:
            // fadeからshakeに変化した際チカチカしながら震えるのを防ぐため、一旦nothingを経由する
            withAnimation {
                activeAction = .nothing
            }
            withAnimation(.easeOut(duration: 0.1).repeatForever(autoreverses: true)) {
                activeAction = actionType
            }
        case .turnUpsideDown:
            activeAction = actionType
        }
    }
}
