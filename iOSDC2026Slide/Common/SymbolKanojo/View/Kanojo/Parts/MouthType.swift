//
//  MouthType.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/01.
//

enum MouthType: Hashable {
    case neutral(MouthSize)
    case smile(MouthSize, TongueType?)
    case dissatisfaction(MouthSize)
    case surprise(MouthSize)
    case happy(MouthSize, TongueType?)
    case smileMischievously(MouthSize)
    case wailing(MouthSize, TongueType?)
    case defeated
    case kiss
    case zipper
    case grittedTeeth
    case tilted(MouthSize)

    enum MouthSize {
        case small
        case medium
        case large
    }

    enum TongueType {
        case licking
        case tongueOut
    }
}
