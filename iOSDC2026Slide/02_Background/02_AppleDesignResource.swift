//
//  02_AppleDesignResource.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/24.
//

import SwiftUI

struct AppleDesignResource: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                title
                Spacer()
            }
            .padding(.leading, 32)
            HStack(spacing: 16) {
                sfSymbols
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                divider
                sfFonts
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                divider
                shape
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 64)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension AppleDesignResource {
    var title: some View {
        Text("Appleのデザインリソース")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.commonText)
    }

    func subtitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 60, weight: .bold, design: .rounded))
            .foregroundStyle(.commonText)
    }

    var sfSymbols: some View {
        func symbol(
            _ name: String,
            color: Color,
            size: CGFloat
        ) -> some View {
            Image(systemName: name)
                .resizable()
                .foregroundStyle(color)
                .scaledToFit()
                .frame(width: size, height: size)
        }
        return VStack(spacing: 32) {
            subtitle("SF Symbols")
            VStack(spacing: 16) {
                // マルチカラー
                HStack(spacing: 16) {
                    Image(systemName: "flag.pattern.checkered.2.crossed")
                        .resizable()
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.red, .blue)
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                    Image(systemName: "rainbow")
                        .resizable()
                        .symbolRenderingMode(.multicolor)
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                }
                // バリエーション
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        symbol("powerplug", color: .red, size: 70)
                        symbol("sparkles.2", color: .yellow, size: 70)
                        symbol("magnifyingglass", color: .blue, size: 70)
                        symbol("phone", color: .green, size: 70)
                    }
                    HStack(spacing: 16) {
                        symbol("cloud.sun", color: .green, size: 70)
                        symbol("balloon.2", color: .orange, size: 70)
                        symbol("puzzlepiece", color: .red, size: 70)
                        symbol("storefront", color: .purple, size: 70)
                    }
                }
                // ウェイト比較
                HStack(spacing: 4) {
                    ForEach([Font.Weight.black, .bold, .medium, .light, .thin], id: \.self) { weight in
                        symbol("umbrella", color: .blue, size: 70)
                            .fontWeight(weight)
                    }
                }
                .padding(.top, 32)
                Spacer(minLength: 0)
                codeSnippet([
                    /*
                     Image(systemName: "heart")
                     .resizable()
                     .foregroundStyle(.brown)
                     .scaledToFit()
                     .frame(width: 8, height: 8)
                     */
                    [
                        (code: "Image", color: .codesnipetLightPurple),
                        (code: "(", color: .codesnipetWhite),
                        (code: "systemName", color: .codesnipetLightPurple),
                        (code: ": ", color: .codesnipetWhite),
                        (code: "\"heart\"", color: .codesnipetOrange),
                        (code: ")", color: .codesnipetWhite),
                    ],
                    [
                        (code: "    .", color: .codesnipetWhite),
                        (code: "resizable", color: .codesnipetPurple),
                        (code: "()", color: .codesnipetWhite)
                    ],
                    [
                        (code: "    .", color: .codesnipetWhite),
                        (code: "foregroundStyle", color: .codesnipetPurple),
                        (code: "(.", color: .codesnipetWhite),
                        (code: "red", color: .codesnipetPurple),
                        (code: ")", color: .codesnipetWhite),
                    ],
                    [
                        (code: "    .", color: .codesnipetWhite),
                        (code: "scaledToFit", color: .codesnipetPurple),
                        (code: "()", color: .codesnipetWhite)
                    ],
                    [
                        (code: "    .", color: .codesnipetWhite),
                        (code: "frame", color: .codesnipetPurple),
                        (code: "(", color: .codesnipetWhite),
                        (code: "width", color: .codesnipetPurple),
                        (code: ": ", color: .codesnipetWhite),
                        (code: "8", color: .codesnipetYellow),
                        (code: ", ", color: .codesnipetWhite),
                        (code: "height", color: .codesnipetPurple),
                        (code: ": ", color: .codesnipetWhite),
                        (code: "8", color: .codesnipetYellow),
                        (code: ")", color: .codesnipetWhite)
                    ],
                ])
            }
        }
    }

    var sfFonts: some View {
        VStack(spacing: 32) {
            subtitle("SF Fonts")
            VStack(alignment: .center, spacing: 16) {
                // スタイル比較
                Text("iOSDC")
                    .font(.system(size: 100, weight: .bold))
                    .foregroundStyle(.fontSample)
                VStack(alignment: .center, spacing: 8) {
                    HStack(alignment: .center, spacing: 32) {
                        Text("iOSDC")
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundStyle(.fontSample)
                        Text("iOSDC")
                            .font(.system(size: 50, weight: .bold, design: .monospaced))
                            .foregroundStyle(.fontSample)
                    }
                    HStack(alignment: .center, spacing: 32) {
                        Text("iOSDC")
                            .font(.system(size: 50, weight: .bold, design: .serif))
                            .foregroundStyle(.fontSample)
                        Text("iOSDC")
                            .font(.system(size: 50, weight: .bold))
                            .italic()
                            .foregroundStyle(.fontSample)
                    }
                }
                // ウェイト比較
                VStack(alignment: .center, spacing: 0) {
                    ForEach([Font.Weight.thin, .light, .medium, .bold, .black], id: \.self) { weight in
                        Text("iOSDC Japan 2026")
                            .font(.system(size: 40))
                            .fontWeight(weight)
                            .foregroundStyle(.fontSample)
                    }
                }
            }
            Spacer(minLength: 0)
            codeSnippet([
                /*
                Text("SF Fonts")
                    .font(.system(
                        size: 17,
                        weight: .bold,
                    ))
                */
                [
                    (code: "Text", color: .codesnipetLightPurple),
                    (code: "(", color: .codesnipetWhite),
                    (code: "\"SF Fonts\"", color: .codesnipetOrange),
                    (code: ")", color: .codesnipetWhite),
                ],
                [
                    (code: "    .", color: .codesnipetWhite),
                    (code: "font", color: .codesnipetPurple),
                    (code: "(.", color: .codesnipetWhite),
                    (code: "system", color: .codesnipetPurple),
                    (code: "(", color: .codesnipetWhite),
                ],
                [
                    (code: "        size", color: .codesnipetPurple),
                    (code: ": ", color: .codesnipetWhite),
                    (code: "17", color: .codesnipetYellow),
                    (code: ",", color: .codesnipetWhite),
                ],
                [
                    (code: "        weight", color: .codesnipetPurple),
                    (code: ": .", color: .codesnipetWhite),
                    (code: "bold", color: .codesnipetYellow)
                ],
                [
                    (code: "    ))", color: .codesnipetWhite),
                ]
            ])
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
            VStack(alignment: .center, spacing: 32) {
                HStack(spacing: 20) {
                    Circle()
                        .stroke(.shapeBlue, lineWidth: 8)
                        .frame(width: 105, height: 105)
                    Circle()
                        .foregroundStyle(.shapeBlue)
                        .frame(width: 90, height: 90)
                    Circle()
                        .stroke(.shapeBlue, lineWidth: 16)
                        .fill(.shapeBlue.opacity(0.2))
                        .frame(width: 120, height: 128)
                }
                HStack(spacing: 40) {
                    Rectangle()
                        .stroke(.shapeBlue, lineWidth: 24)
                        .fill(.shapeBlue.opacity(0.2))
                        .frame(width: 70, height: 360)
                    VStack(spacing: 24) {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.shapeBlue)
                            .frame(width: 240, height: 100)
                        Capsule()
                            .stroke(.shapeBlue, lineWidth: 8)
                            .foregroundStyle(.clear)
                            .frame(width: 200, height: 100)
                        Ellipse()
                            .foregroundStyle(.shapeBlue)
                            .frame(width: 200, height: 100)
                    }
                }
            }
            Spacer(minLength: 0)
            codeSnippet([
                /*
                Rectangle()
                    .foregroundStyle(.red)
                    .stroke(
                        .blue,
                        lineWidth: 2
                    )
                    .frame(width: 8, height: 4)
                */
                [
                    (code: "Rectangle", color: .codesnipetLightPurple),
                    (code: "()", color: .codesnipetWhite),
                ],
                [
                    (code: "    .", color: .codesnipetWhite),
                    (code: "foregroundStyle", color: .codesnipetPurple),
                    (code: "(.", color: .codesnipetWhite),
                    (code: "red", color: .codesnipetPurple),
                    (code: ")", color: .codesnipetWhite),
                ],
                [
                    (code: "    .", color: .codesnipetWhite),
                    (code: "stroke", color: .codesnipetPurple),
                    (code: "(.", color: .codesnipetWhite),
                    (code: "blue", color: .codesnipetPurple),
                    (code: ", ", color: .codesnipetWhite),
                    (code: "lineWidth", color: .codesnipetPurple),
                    (code: ": ", color: .codesnipetWhite),
                    (code: "2", color: .codesnipetYellow),
                    (code: ")", color: .codesnipetWhite)
                ],
                [
                    (code: "    .", color: .codesnipetWhite),
                    (code: "frame", color: .codesnipetPurple),
                    (code: "(", color: .codesnipetWhite),
                    (code: "width", color: .codesnipetPurple),
                    (code: ": ", color: .codesnipetWhite),
                    (code: "8", color: .codesnipetYellow),
                    (code: ", ", color: .codesnipetWhite),
                    (code: "height", color: .codesnipetPurple),
                    (code: ": ", color: .codesnipetWhite),
                    (code: "4", color: .codesnipetYellow),
                    (code: ")", color: .codesnipetWhite)
                ],
            ])
        }
    }

    var divider: some View {
        Capsule()
            .fill(.guidelinesDivider)
            .frame(width: 5, height: 800)
    }

    func codeSnippet(_ codeLayouts: [[(code: String, color: Color)]]) -> some View {
        VStack(alignment: .leading) {
            ForEach(codeLayouts.enumerated(), id: \.offset) { lineNumber, line in
                HStack(spacing: 0) {
                    Text(String(lineNumber))
                        .font(.system(size: 17, weight: .semibold, design: .monospaced))
                        .foregroundStyle(.codesnipetGray)
                        .frame(width: 18)
                        .padding(.trailing, 16)
                    ForEach(line.enumerated(), id: \.offset) { index, codeLayout in
                        Text(codeLayout.code)
                            .font(.system(size: 17, weight: .semibold, design: .monospaced))
                            .foregroundStyle(codeLayout.color)
                    }
                    Spacer(minLength: 0)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.black.opacity(0.9))
        )
    }
}
