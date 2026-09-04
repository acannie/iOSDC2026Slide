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
            ZStack {
                symbol("magnifyingglass", color: .blue, size: 400)
                VStack {
                    HStack {
                        symbol("powerplug", color: .red, size: 70)
                        symbol("sparkles.2", color: .yellow, size: 70)
                    }
                    HStack {
                        symbol("cloud.sun", color: .green, size: 70)
                        symbol("balloon.2", color: .orange, size: 70)
                    }
                }
                .offset(x: -50, y: -50)
            }
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

    var sfFonts: some View {
        VStack(spacing: 32) {
            subtitle("SF Fonts")
            VStack(alignment: .leading, spacing: 4) {
                Text("iOSDC")
                    .font(.system(size: 100))
                Text("𝐢𝐎𝐒𝐃𝐂")
                    .font(.system(size: 100))
                Text("iOSDC Japan 2026")
                    .font(.system(size: 30, design: .rounded))
                Text("iOSDC Japan 2026")
                    .font(.system(size: 30, weight: .ultraLight))
            }
            Spacer()
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
            VStack(alignment: .leading, spacing: 24) {
                HStack(spacing: 24) {
                    Rectangle()
                        .foregroundStyle(.red)
                        .frame(width: 64, height: 128)
                    Ellipse()
                        .stroke(.blue, lineWidth: 16)
                        .foregroundStyle(.clear)
                        .frame(width: 128, height: 32)
                        .rotationEffect(.degrees(45))
                }
                HStack(spacing: 24) {
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(.green, lineWidth: 16)
                        .foregroundStyle(.clear)
                        .frame(width: 64, height: 32)
                    Circle()
                        .foregroundStyle(.yellow)
                        .frame(width: 64, height: 64)
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
            .frame(width: 5, height: 750)
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
