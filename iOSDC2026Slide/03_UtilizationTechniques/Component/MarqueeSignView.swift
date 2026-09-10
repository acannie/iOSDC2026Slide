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
    @State private var isLighting: Bool = false
    @State private var isShowingMarqueeSign: Bool = false
    @Namespace private var namespace

    var body: some View {
        ZStack {
            if isShowingMarqueeSign {
                ZStack {
                    sign
                    bulbs
                }
            } else {
                symbols
            }
        }
        .frame(width: 490, height: 200)
        .onTapGesture {
            withAnimation(.easeOut(duration: 1)) {
                isShowingMarqueeSign.toggle()
            }
        }
        .task {
            while true {
                try? await Task.sleep(for: .seconds(0.1))
                count += 1
            }
        }
        .onChange(of: isDay) {
            Task {
                if isDay {
                    withAnimation(.easeInOut) {
                        isLighting = false
                    }
                } else {
                    withAnimation(.easeInOut) {
                        isLighting = true
                    }
                }
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
        func text(_ char: String, symbolName: SymbolName) -> some View {
            ZStack {
                Text(char)
                    .font(.system(size: iosdcJapanFontSize, design: .monospaced))
                    .foregroundStyle(isDay ? .marqueeSignLightBlueText : .marqueeSignDarkBlueText)
                    .offset(x: 2, y: 2)
                Text(char)
                    .font(.system(size: iosdcJapanFontSize, design: .monospaced))
                    .foregroundStyle(isDay ? .marqueeSignLightRedText : .marqueeSignDarkRedText)
            }
            .matchedGeometryEffect(id: symbolName, in: namespace)
        }
        return ZStack {
            // iOSDC JAPAN
            HStack(spacing: 20) {
                HStack(spacing: 2) {
                    ForEach(iosdc.enumerated(), id: \.offset) { index, letter in
                        let level = CGFloat(index) / CGFloat(iosdc.count)
                        text(letter, symbolName: .iosdc(letter))
                            .scaleEffect(y: scale(for: level))
                            .offset(y: offset(for: level))
                    }
                }
                HStack(spacing: 0) {
                    ForEach(japan.enumerated(), id: \.offset) { index, letter in
                        let level = CGFloat(japan.count - 1 - index) / CGFloat(iosdc.count)
                        text(letter, symbolName: .japan(letter, index))
                            .scaleEffect(y: scale(for: level))
                            .offset(y: offset(for: level))
                    }
                }
            }
            // 2026
            Text("𝟐𝟎𝟐𝟔")
                .matchedGeometryEffect(id: SymbolName.year, in: namespace)
                .font(.system(size: 50))
                .foregroundStyle(isDay ? .marqueeSignLightRedText : .marqueeSignDarkRedText)
                .offset(y: 50)
                .offset(x: -10)
            // 唐草模様
            ForEach(Side.allCases) { side in
                VStack(spacing: 16) {
                    Text("S")
                        .matchedGeometryEffect(id: SymbolName.s1(side), in: namespace)
                        .foregroundStyle(isDay ? .marqueeSignLightBrownDecoration : .marqueeSignDarkBrownDecoration)
                        .scaleEffect(y: 3)
                    Text("S")
                        .matchedGeometryEffect(id: SymbolName.s2(side), in: namespace)
                        .foregroundStyle(isDay ? .marqueeSignLightBrownDecoration : .marqueeSignDarkBrownDecoration)
                        .scaleEffect(y: 3)
                        .rotation3DEffect(.degrees(180), axis: (1, 0, 0))
                    Text("S")
                        .matchedGeometryEffect(id: SymbolName.s3(side), in: namespace)
                        .foregroundStyle(isDay ? .marqueeSignLightBrownDecoration : .marqueeSignDarkBrownDecoration)
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
                    .fill(isDay ? .marqueeSignLightBackgroundShadow : .marqueeSignDarkBackgroundShadow)
                    .offset(x: 8, y: 8)
                Rectangle()
                    .fill(isDay ? .marqueeSignLightBackground : .marqueeSignDarkBackground)
            }
        )
    }

    var bulbs: some View {
        var lightingBlub: some View {
            Circle()
                .foregroundStyle(.marqueeSignLightingBulb)
                .frame(width: 20)
                .shadow(color: .marqueeSignLightingBulbShadow, radius: 10)
        }
        var unlightingBlub: some View {
            Circle()
                .foregroundStyle(isDay ? .marqueeSignLightUnligntingBulb : .marqueeSignDarkUnligntingBulb)
                .frame(width: 20)
        }
        return VStack(spacing: 4) {
            // 上行
            HStack(spacing: 4) {
                ForEach(0..<20) { index in
                    if !isLighting || (count + index) % 4 == 0 {
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
                        if !isLighting || (count - index) % 4 == 1 {
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
                        if !isLighting || (count + index) % 4 == 0 {
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
                    if !isLighting || (-count + index + 3) % 4 == 0 {
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

private extension MarqueeSignView {
    enum SymbolName: Hashable {
        case iosdc(String)
        case japan(String, Int)
        case s1(Side)
        case s2(Side)
        case s3(Side)
        case year
    }

    var symbols: some View {
        let charSize: CGFloat = 80
        return VStack {
            HStack {
                Text("𝐢")
                    .matchedGeometryEffect(id: SymbolName.iosdc("𝐢"), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("𝐎")
                    .matchedGeometryEffect(id: SymbolName.iosdc("𝐎"), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("𝐒")
                    .matchedGeometryEffect(id: SymbolName.iosdc("𝐒"), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("𝐃")
                    .matchedGeometryEffect(id: SymbolName.iosdc("𝐃"), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("𝐂")
                    .matchedGeometryEffect(id: SymbolName.iosdc("𝐂"), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
            }
            HStack {
                Text("𝐉")
                    .matchedGeometryEffect(id: SymbolName.japan("𝐉", 0), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("𝐀")
                    .matchedGeometryEffect(id: SymbolName.japan("𝐀", 1), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("𝐏")
                    .matchedGeometryEffect(id: SymbolName.japan("𝐏", 2), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("𝐀")
                    .matchedGeometryEffect(id: SymbolName.japan("𝐀", 3), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("𝐍")
                    .matchedGeometryEffect(id: SymbolName.japan("𝐍", 4), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
            }
            HStack {
                Text("𝟐𝟎𝟐𝟔")
                    .matchedGeometryEffect(id: SymbolName.year, in: namespace)
                    .font(.system(size: 50, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
            }
            HStack {
                Text("S")
                    .matchedGeometryEffect(id: SymbolName.s1(.left), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("S")
                    .matchedGeometryEffect(id: SymbolName.s2(.left), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("S")
                    .matchedGeometryEffect(id: SymbolName.s3(.left), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("S")
                    .matchedGeometryEffect(id: SymbolName.s1(.right), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("S")
                    .matchedGeometryEffect(id: SymbolName.s2(.right), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
                Text("S")
                    .matchedGeometryEffect(id: SymbolName.s3(.right), in: namespace)
                    .font(.system(size: charSize, design: .monospaced))
                    .foregroundStyle(.symbolEyes)
            }
        }
    }
}
