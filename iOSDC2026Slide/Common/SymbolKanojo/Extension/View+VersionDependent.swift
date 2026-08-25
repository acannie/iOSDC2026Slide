//
//  View+VersionDependent.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/01.
//

import SwiftUI

extension View {
    @ViewBuilder
    func ios18Animation(_ animationType: Ios18AnimationType, repeatCount: Int = 100, isActive: Bool = true) -> some View {
        if #available(iOS 18.0, *) {
            switch animationType {
            case .bounce:
                self.symbolEffect(.bounce, options: .repeat(repeatCount), isActive: isActive)
            case .rotate:
                self.symbolEffect(.rotate, options: .repeat(repeatCount), isActive: isActive)
            case .appear:
                self.symbolEffect(.appear, options: .repeat(repeatCount), isActive: isActive)
            case .breath:
                self.symbolEffect(.breathe, options: .repeat(repeatCount), isActive: isActive)
            case .disappear:
                self.symbolEffect(.disappear, options: .repeat(repeatCount), isActive: isActive)
            case .pulse:
                self.symbolEffect(.pulse, options: .repeat(repeatCount), isActive: isActive)
            case .scale:
                self.symbolEffect(.scale, options: .repeat(repeatCount), isActive: isActive)
            case .variableColor:
                self.symbolEffect(.variableColor, options: .repeat(repeatCount), isActive: isActive)
            case .wiggle:
                self.symbolEffect(.wiggle, options: .repeat(repeatCount), isActive: isActive)
            }
        } else {
            self
        }
    }
}

enum Ios18AnimationType {
    case appear
    case bounce
    case breath
    case disappear
    case pulse
    case rotate
    case scale
    case variableColor
    case wiggle
}
