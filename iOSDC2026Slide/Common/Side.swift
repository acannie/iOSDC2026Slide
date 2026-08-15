//
//  Side.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import CoreFoundation

enum Side: CaseIterable, Identifiable {
    case left
    case right

    var id: Self { self }

    var unit: CGFloat {
        switch self {
        case .left: -1
        case .right: 1
        }
    }

    var isLeft: Bool {
        self == .left
    }
}
