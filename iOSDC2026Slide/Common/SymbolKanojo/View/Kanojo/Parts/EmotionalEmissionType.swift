//
//  EmotionalEmissionType.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

enum EmotionalEmissionType: Hashable {
    case nothing
    case tear(TearType)
    case sweat
    case snore
    case vomit
    case snot(SnotType)
    case drool
    case smoke
    case halo
    case horns
    case heart
    case confetti
    case grawlix
    case explode

    enum TearType {
        case moist
        case weep
        case sob
    }

    enum SnotType {
        case bubble
        case drop
    }
}
