//
//  02_Suggestion.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/24.
//

import SwiftUI

struct Suggestion: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                title
                Spacer()
            }
            .padding(.leading, 64)
            .padding(.top, 64)
            HStack(spacing: 12) {
                sfSymbols
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                divider
                sfFonts
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                divider
                shape
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.horizontal, 64)
            .padding(.bottom, 64)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension Suggestion {
    var title: some View {
        Text("Appleの標準リソース")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.commonText)
    }

    func subtitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 60, weight: .bold, design: .rounded))
            .foregroundStyle(.commonText)
    }

    var sfSymbols: some View {
        VStack {
            subtitle("SF Symbols")
            Rectangle()
                .foregroundStyle(.red)
        }
    }

    var sfFonts: some View {
        VStack {
            subtitle("SF Fonts")
            Rectangle()
                .foregroundStyle(.green)
        }
    }

    var shape: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 12) {
                Text("SwiftUI")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(.commonText)
                subtitle("Shape")
            }
            Rectangle()
                .foregroundStyle(.blue)
        }
    }

    var divider: some View {
        Capsule()
            .fill(.guidelinesDivider)
            .frame(width: 5, height: 750)
    }
}
