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
            codeSnippet([
                "Image(systemName: name)",
                "\t.resizable()",
                "\t.foregroundStyle(.brown)",
                "\t.scaledToFit()",
                "\t.frame(width: 32, height: 32)"
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
                "Text(\"SF Fonts\")",
                "\t.font(\".system(size: 17, weight: .bold)\")"
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
            Spacer()
            codeSnippet([
                "Rectangle()",
                "\t.foregroundStyle(.red)",
                "\t.frame(width: 128, height: 64)"
            ])
        }
    }

    var divider: some View {
        Capsule()
            .fill(.guidelinesDivider)
            .frame(width: 5, height: 750)
    }

    func codeSnippet(_ codes: [String]) -> some View {
        VStack(alignment: .leading) {
            ForEach(Array(codes.enumerated()), id: \.offset) { index, code in
                HStack(alignment: .top, spacing: 16) {
                    Text(String(index))
                        .font(.system(size: 18, weight: .semibold, design: .monospaced))
                        .foregroundStyle(.white)
                    .frame(width: 32)
                    Text(code)
                        .font(.system(size: 18, weight: .semibold, design: .monospaced))
                        .foregroundStyle(.white)
                    Spacer()
                }
            }
        }
        .padding(16)
        .background(.black.opacity(0.9))
    }
}
