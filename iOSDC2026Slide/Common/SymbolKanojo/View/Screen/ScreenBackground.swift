//
//  ScreenBackground.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/05.
//

import SwiftUI

enum ScreenBackground {
    case japaneseRoom
    case sky
    case geometry

    var view: some View {
        Image(self.imageName)
            .resizable()
            .scaledToFill()
            .clipped()
    }
}

private extension ScreenBackground {
    var imageName: String {
        switch self {
        case .japaneseRoom:
            "background_japaneseRoom"
        case .sky:
            "background_sky"
        case .geometry:
            "background_geometry"
        }
    }
}
