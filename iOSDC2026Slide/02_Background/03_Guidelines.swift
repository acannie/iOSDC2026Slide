//
//  04_Guidelines.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/29.
//

import SwiftUI

struct Guidelines: View {
    var body: some View {
        VStack {
            title
                .padding(.top, 64)
            Spacer()
            HStack(alignment: .top, spacing: 32) {
                ForEach(Array(SectionType.allCases.enumerated()), id: \.offset) { index, sectionType in
                    section(for: sectionType)
                    if index < SectionType.allCases.count - 1 {
                        divider
                    }
                }
            }
            .padding(.horizontal, 64)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension Guidelines {
    enum SectionType: String, CaseIterable{
        case ok = "OK"
        case ng = "NG"

        var lightColor: Color {
            switch self {
            case .ok: .guidelinesOkLight
            case .ng: .guidelinesNgLight
            }
        }

        var middleColor: Color {
            switch self {
            case .ok: .guidelinesOkMiddle
            case .ng: .guidelinesNgMiddle
            }
        }

        var darkColor: Color {
            switch self {
            case .ok: .guidelinesOkDark
            case .ng: .guidelinesNgDark
            }
        }

        var iconName: String {
            switch self {
            case .ok: "checkmark"
            case .ng: "xmark"
            }
        }

        var items: [String] {
            switch self {
            case .ok: [
                "Apple製品向けアプリでの利用",
                "色や形のカスタム"
            ]
            case .ng: [
                "アプリアイコンへの利用",
                "Apple以外のOSや\nWebでの利用",
                "商標アイコンの改変"
            ]
            }
        }
    }

    var title: some View {
        Text("利用規約の確認")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.commonText)
    }

    func section(for sectionType: SectionType) -> some View {
        VStack {
            // タイトル
            HStack(spacing: 20) {
                Image(systemName: sectionType.iconName)
                    .resizable()
                    .fontWeight(.black)
                    .foregroundStyle(sectionType.middleColor)
                    .scaledToFit()
                    .frame(height: 48)
                Text(sectionType.rawValue)
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundStyle(sectionType.darkColor)
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(sectionType.lightColor)
            )
            // 箇条書き
            VStack(spacing: 0) {
                ForEach(sectionType.items, id: \.self) { item in
                    HStack(alignment: .top, spacing: 8) {
                        Circle()
                            .fill(sectionType.darkColor)
                            .frame(width: 10, height: 10)
                            .frame(width: 60, height: 60)
                        Text(item)
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundStyle(sectionType.darkColor)
                        Spacer()
                    }
                    .padding(.vertical, 20)
                }
            }
        }
    }

    var divider: some View {
        Capsule()
            .fill(.guidelinesDivider)
            .frame(width: 5, height: 550)
    }
}
