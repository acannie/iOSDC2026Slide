//
//  GestureType.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

enum GestureType: Hashable {
    case palmOutFront(PalmOutFrontType)
    case backhandOutFront(BackhandOutFrontType)
    case thumbIndexUp(ThumbIndexUpType)
    case shushFinger(ShushFingerType)

    enum PalmOutFrontType {
        case waving
        case salute
    }

    enum BackhandOutFrontType {
        case normal
        case coverEyes
        case coverMouth
        case faceHoldShock
    }

    enum ThumbIndexUpType {
        case thinking
    }

    enum ShushFingerType {
        case shush
    }
}
