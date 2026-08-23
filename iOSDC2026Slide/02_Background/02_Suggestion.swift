//
//  02_Suggestion.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/24.
//

import SwiftUI

struct Suggestion: View {
    private enum CheckmarkItem: CaseIterable {
        case sfSymbols
        case sfFonts
        case shape

        var text: String {
            switch self {
            case .sfSymbols: "SF Symbols"
            case .sfFonts: "SF Fonts"
            case .shape: "Shape"
            }
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(CheckmarkItem.allCases, id: \.self) { checkmarkItem in
                item(checkmarkItem.text)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension Suggestion {
    func item(_ text: String) -> some View {
        HStack(spacing: 32) {
            Image(systemName: "checkmark")
                .resizable()
                .fontWeight(.semibold)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.green)
                .frame(width: 100, height: 100)
            Text(text)
                .font(.system(size: 100, weight: .semibold))
        }
    }
}
