//
//  MarqueeSignView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/16.
//

import SwiftUI

struct MarqueeSignView: View {
    let isDay: Bool
    @State private var count: Int = 0

    var body: some View {
        ZStack {
            sign
            bulbs
        }
        .frame(width: 490, height: 200)
        .task {
            while true {
                try? await Task.sleep(for: .seconds(0.1))
                count += 1
            }
        }
    }

    var sign: some View {
        let iosdcJapanFontSize: CGFloat = 60
        let iosdc = ["𝐢", "𝐎", "𝐒", "𝐃", "𝐂"]
        let japan = ["𝐉", "𝐀", "𝐏", "𝐀", "𝐍"]
        let maxScale: CGFloat = 2.0
        func scale(for level: CGFloat) -> CGFloat {
            maxScale * (1 - level) + 1.0
        }
        func offset(for level: CGFloat) -> CGFloat {
            -level * iosdcJapanFontSize * 0.7
        }
        func text(_ char: String) -> some View {
            ZStack {
                Text(char)
                    .font(.system(size: iosdcJapanFontSize, design: .monospaced))
                    .foregroundStyle(.marqueeSignBlueText)
                    .offset(x: 2, y: 2)
                Text(char)
                    .font(.system(size: iosdcJapanFontSize, design: .monospaced))
                    .foregroundStyle(.marqueeSignRedText)
            }
        }
        return ZStack {
            // iOSDC JAPAN
            HStack(spacing: 20) {
                HStack(spacing: 2) {
                    ForEach(iosdc.enumerated(), id: \.offset) { index, letter in
                        let level = CGFloat(index) / CGFloat(iosdc.count)
                        text(letter)
                            .scaleEffect(y: scale(for: level))
                            .offset(y: offset(for: level))
                    }
                }
                HStack(spacing: 0) {
                    ForEach(japan.enumerated(), id: \.offset) { index, letter in
                        let level = CGFloat(japan.count - 1 - index) / CGFloat(iosdc.count)
                        text(letter)
                            .scaleEffect(y: scale(for: level))
                            .offset(y: offset(for: level))
                    }
                }
            }
            // 2026
            Text("𝟐𝟎𝟐𝟔")
                .font(.system(size: 50))
                .foregroundStyle(.marqueeSignRedText)
                .offset(y: 50)
                .offset(x: -10)
            // 唐草模様
            ForEach(Side.allCases) { side in
                VStack(spacing: 16) {
                    Text("S")
                        .foregroundStyle(.marqueeSignBrownDecoration)
                        .scaleEffect(y: 3)
                    Text("S")
                        .foregroundStyle(.marqueeSignBrownDecoration)
                        .scaleEffect(y: 3)
                        .rotation3DEffect(.degrees(180), axis: (1, 0, 0))
                    Text("S")
                        .foregroundStyle(.marqueeSignBrownDecoration)
                        .scaleEffect(y: 3)
                }
                .rotationEffect(.degrees(side.unit * 115))
                .offset(x: side.unit * 80, y: 40)
            }
            .offset(x: -10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            ZStack {
                Rectangle()
                    .fill(.marqueeSignBackgroundShadow)
                    .offset(x: 8, y: 8)
                Rectangle()
                    .fill(.marqueeSignBackground)
            }
        )
    }

    var bulbs: some View {
        var lightingBlub: some View {
            Circle()
                .foregroundStyle(.marqueeSignLigntningBulb)
                .frame(width: 20)
                .shadow(color: .marqueeSignLigntningBulbShadow, radius: 10)
        }
        var unlightingBlub: some View {
            Circle()
                .foregroundStyle(.marqueeSignUnligntingBulb)
                .frame(width: 20)
        }
        return VStack(spacing: 4) {
            // 上行
            HStack(spacing: 4) {
                ForEach(0..<20) { index in
                    if (count + index) % 4 == 0 {
                        unlightingBlub
                    } else {
                        lightingBlub
                    }
                }
            }
            HStack {
                // 左列
                VStack(spacing: 4) {
                    ForEach(0..<6) { index in
                        if (count - index) % 4 == 1 {
                            unlightingBlub
                        } else {
                            lightingBlub
                        }
                    }
                }
                Spacer()
                // 右列
                VStack(spacing: 4) {
                    ForEach(0..<6) { index in
                        if (count + index) % 4 == 0 {
                            unlightingBlub
                        } else {
                            lightingBlub
                        }
                    }
                }
            }
            // 下行
            HStack(spacing: 4) {
                ForEach(0..<20) { index in
                    if (-count + index + 3) % 4 == 0 {
                        unlightingBlub
                    } else {
                        lightingBlub
                    }
                }
            }
        }
        .padding(8)
    }
}
