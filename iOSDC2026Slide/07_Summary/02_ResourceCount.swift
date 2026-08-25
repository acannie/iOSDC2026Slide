//
//  02_ResourceCount.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct ResourceCount: View {
    var body: some View {
        VStack {
            HStack {
                title
                Spacer()
            }
            .padding(.leading, 64)
            .padding(.top, 64)
            Spacer()
            Grid(horizontalSpacing: 64, verticalSpacing: 8) {
                ForEach(ResourceItem.allCases, id: \.self) { resourceItem in
                    gridRow(resourceItem)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private enum ResourceItem: CaseIterable {
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

    var count: Int {
        switch self {
        case .sfSymbols: 100
        case .sfFonts: 10
        case .shape: 30
        }
    }
}

private extension ResourceCount {
    var title: some View {
        Text("スライドで使用したリソース数")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.commonText)
    }

    func gridRow(_ resourceItem: ResourceItem) -> some View {
        GridRow {
            // アイコン
            switch resourceItem {
            case .sfSymbols:
                Image(systemName: "cloud.sun")
                    .resizable()
                    .fontWeight(.semibold)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.green)
                    .frame(width: 100, height: 100)
            case .sfFonts:
                Text("あ")
                    .font(.system(size: 100, weight: .semibold))
                    .foregroundStyle(.green)
            case .shape:
                Rectangle()
                    .stroke(.green, lineWidth: 10)
                    .frame(width: 70, height: 70)
            }
            Text(resourceItem.text)
                .font(.system(size: 100, weight: .semibold))
                .foregroundStyle(.commonText)
                .gridColumnAlignment(.leading)
            Text(String(resourceItem.count))
                .font(.system(size: 100, weight: .semibold))
                .foregroundStyle(.commonText)
                .gridColumnAlignment(.trailing)
        }
    }
}
