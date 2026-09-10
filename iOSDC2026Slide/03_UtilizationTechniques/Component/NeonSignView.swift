//
//  NeonSignView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/16.
//

import SwiftUI

struct NeonSignView: View {
    let isDay: Bool
    @State private var count: Int = 0
    @State private var isLighting: Bool = false
    @State private var isShowingNeonSign: Bool = false
    @Namespace private var namespace

    // MARK: 光の色
    var lightingWhite: Color {
        isLighting ? .neonLightingWhite : .clear
    }

    var lightingMagenta: Color {
        isLighting ? .neonLightingMagenta : .clear
    }
    var lightingYellow: Color {
        isLighting ? .neonLightingYellow : .clear
    }
    var lightingCyan: Color {
        isLighting ? .neonLightingCyan : .clear
    }
    var lightingOrange: Color {
        isLighting ? .neonLightingOrange : .clear
    }
    var lightingBlue: Color {
        isLighting ? .neonLightingBlue : .clear
    }
    var lightingGreen: Color {
        isLighting ? .neonLightingGreen : .clear
    }
    var lightingPurple: Color {
        isLighting ? .neonLightingPurple : .clear
    }
    // MARK: ネオン管の色
    var neonTubeShadow: Color {
        isDay ? .black.opacity(0.2) : .clear
    }

    var neonTubeMagenta: Color {
        isDay ? .neonLightMagenta : .neonDarkMagenta
    }
    var neonTubeYellow: Color {
        isDay ? .neonLightYellow : .neonDarkYellow
    }
    var neonTubeCyan: Color {
        isDay ? .neonLightCyan : .neonDarkCyan
    }
    var neonTubeOrange: Color {
        isDay ? .neonLightOrange : .neonDarkOrange
    }
    var neonTubeBlue: Color {
        isDay ? .neonLightBlue : .neonDarkBlue
    }
    var neonTubeGreen: Color {
        isDay ? .neonLightGreen : .neonDarkGreen
    }
    var neonTubePurple: Color {
        isDay ? .neonLightPurple : .neonDarkPurple
    }

    var opacity: CGFloat {
        count % 3 == 0 ? 0 : 1
    }

    var body: some View {
        ZStack {
            if isShowingNeonSign {
                ZStack {
                    circle
                    palmTree
                        .offset(x: 130)
                    drink
                        .offset(x: 270)
                    microphone
                        .offset(x: 200, y: 15)
                    waves
                        .offset(x: 200, y: 80)
                    iosdc
                        .offset(x: -60)
                }
            } else {
                symbols
            }
        }
        .offset(x: -55)
        .frame(width: 540, height: 320)
        .onTapGesture {
            withAnimation(.easeOut(duration: 1)) {
                isShowingNeonSign.toggle()
            }
        }
        .onChange(of: isDay) {
            Task {
                if isDay {
                    withAnimation(.spring(duration: 0.4, bounce: 0.75)) {
                        isLighting = false
                    }
                } else {
                    withAnimation(.spring(duration: 0.4, bounce: 0.75).delay(1.0)) {
                        isLighting = true
                    }
                }
            }
        }
        .task(id: isDay) {
            if isDay {
                count = 0
            } else {
                while !Task.isCancelled {
                    try? await Task.sleep(for: .seconds(1))
                    if Task.isCancelled { break }
                    count += 1
                }
            }
        }
    }

    var circle: some View {
        ZStack {
            // 外側の円
            Group {
                // 上部
                Circle()
                    .trim(from: 0.15, to: 0.45)
                    .stroke(neonTubeMagenta, lineWidth: 10)
                    .matchedGeometryEffect(id: SymbolName.outerCircleTop, in: namespace)
                    .frame(width: 300)
                    .shadow(color: lightingMagenta, radius: 5)
                    .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                Circle()
                    .trim(from: 0.15, to: 0.45)
                    .stroke(lightingWhite, lineWidth: 5)
                    .frame(width: 300)
                // 下部
                Circle()
                    .trim(from: 0.55, to: 0.8)
                    .stroke(neonTubeMagenta, lineWidth: 10)
                    .matchedGeometryEffect(id: SymbolName.outerCircleBottom, in: namespace)
                    .frame(width: 300)
                    .shadow(color: lightingMagenta, radius: 5)
                    .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                Circle()
                    .trim(from: 0.55, to: 0.8)
                    .stroke(lightingWhite, lineWidth: 5)
                    .frame(width: 300)
            }
            // 内側の円
            Group {
                // 上部
                Group {
                    Circle()
                        .trim(from: 0.56, to: 0.79)
                        .stroke(neonTubeYellow, lineWidth: 10)
                        .matchedGeometryEffect(id: SymbolName.innerCircleTop, in: namespace)
                        .frame(width: 250)
                        .shadow(color: lightingYellow, radius: 5)
                        .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                    Circle()
                        .trim(from: 0.56, to: 0.79)
                        .stroke(lightingWhite, lineWidth: 5)
                        .frame(width: 250)
                }
                // ヤシの幹兼円の一部
                Group {
                    Group {
                        Circle()
                            .trim(from: 0.92, to: 1.0)
                            .stroke(neonTubeOrange, lineWidth: 10)
                            .matchedGeometryEffect(id: SymbolName.innerCircleRight, in: namespace)
                            .frame(width: 250)
                            .shadow(color: lightingOrange, radius: 5)
                            .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                        Circle()
                            .trim(from: 0.92, to: 1.0)
                            .stroke(lightingWhite, lineWidth: 5)
                            .frame(width: 250)
                    }
                    Group {
                        Circle()
                            .trim(from: 0.0, to: 0.06)
                            .stroke(neonTubeOrange, lineWidth: 10)
                            .frame(width: 250)
                            .shadow(color: lightingOrange, radius: 5)
                            .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                        Circle()
                            .trim(from: 0.0, to: 0.06)
                            .stroke(lightingWhite, lineWidth: 5)
                            .frame(width: 250)
                    }
                }
                // 下部
                Group {
                    Circle()
                        .trim(from: 0.16, to: 0.44)
                        .stroke(neonTubeYellow, lineWidth: 10)
                        .matchedGeometryEffect(id: SymbolName.innerCircleBottom, in: namespace)
                        .frame(width: 250)
                        .shadow(color: lightingYellow, radius: 5)
                        .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                    Circle()
                        .trim(from: 0.16, to: 0.44)
                        .stroke(lightingWhite, lineWidth: 5)
                        .frame(width: 250)
                }
            }
        }
    }

    var palmTree: some View {
        func leaf(size: CGFloat, symbolName: SymbolName) -> some View {
            ZStack {
                Image(systemName: "moon")
                    .resizable()
                    .matchedGeometryEffect(id: symbolName, in: namespace)
                    .fontWeight(.bold)
                    .foregroundStyle(neonTubeGreen)
                    .frame(width: size, height: size)
                    .shadow(color: lightingGreen, radius: 5)
                    .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                Image(systemName: "moon")
                    .resizable()
                    .fontWeight(.light)
                    .foregroundStyle(lightingWhite)
                    .frame(width: size - 5, height: size - 5)
            }
        }
        return ZStack {
            // 葉
            leaf(size: 75, symbolName: .palmTreeLeaf1)
                .rotationEffect(.degrees(130))
                .offset(x: -65, y: -75)
            leaf(size: 80, symbolName: .palmTreeLeaf2)
                .rotationEffect(.degrees(155))
                .offset(x: -45, y: -115)
            leaf(size: 75, symbolName: .palmTreeLeaf3)
                .rotationEffect(.degrees(135))
                .offset(x: 35, y: -100)
            leaf(size: 70, symbolName: .palmTreeLeaf4)
                .rotationEffect(.degrees(170))
                .offset(x: 35, y: -60)
            // 幹
            Group {
                Text("ノ")
                    .matchedGeometryEffect(id: SymbolName.palmTreeRight, in: namespace)
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundStyle(neonTubeOrange)
                    .shadow(color: lightingOrange, radius: 5)
                    .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                Text("ノ")
                    .font(.system(size: 80, weight: .light, design: .rounded))
                    .foregroundStyle(lightingWhite)
            }
            .rotationEffect(.degrees(-55))
            .scaleEffect(y: 1.5)
            .offset(x: 10, y: -5)
        }
    }

    var drink: some View {
        ZStack {
            // グラス
            Group {
                Image(systemName: "wineglass")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.wineGlass, in: namespace)
                    .fontWeight(.bold)
                    .foregroundStyle(neonTubePurple)
                    .frame(width: 70, height: 100)
                    .shadow(color: lightingPurple, radius: 5)
                    .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                Image(systemName: "wineglass")
                    .resizable()
                    .fontWeight(.light)
                    .foregroundStyle(lightingWhite)
                    .frame(width: 65, height: 95)
            }
            // ストロー
            Group {
                Text("へ")
                    .matchedGeometryEffect(id: SymbolName.straw, in: namespace)
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundStyle(neonTubeYellow)
                    .shadow(color: lightingYellow, radius: 5)
                    .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                Text("へ")
                    .font(.system(size: 58, weight: .medium, design: .rounded))
                    .foregroundStyle(lightingWhite)
            }
            .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
            .rotationEffect(.degrees(-35))
            .offset(x: 10, y: -66)
            // レモン
            Group {
                Circle()
                    .trim(from: 0.3, to: 0.97)
                    .stroke(neonTubeYellow, lineWidth: 7)
                    .matchedGeometryEffect(id: SymbolName.lemon, in: namespace)
                    .frame(width: 40)
                    .shadow(color: lightingYellow, radius: 5)
                    .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                Circle()
                    .trim(from: 0.3, to: 0.97)
                    .stroke(lightingWhite, lineWidth: 5)
                    .frame(width: 40)
            }
            .offset(x: -30, y: -50)
        }
    }

    var microphone: some View {
        ZStack {
            Image(systemName: "microphone")
                .resizable()
                .matchedGeometryEffect(id: SymbolName.microphone, in: namespace)
                .fontWeight(.semibold)
                .foregroundStyle(neonTubeYellow)
                .frame(width: 50, height: 70)
                .shadow(color: lightingYellow, radius: 5)
                .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
            Image(systemName: "microphone")
                .resizable()
                .fontWeight(.light)
                .foregroundStyle(lightingWhite)
                .frame(width: 45, height: 65)
        }
    }

    var waves: some View {
        HStack(spacing: 0) {
            ForEach(0..<2) { index in
                ZStack {
                    Image(systemName: "water.waves")
                        .resizable()
                        .matchedGeometryEffect(
                            id: index == 0 ? SymbolName.waveLeft : .waveRight,
                            in: namespace
                        )
                        .fontWeight(.black)
                        .foregroundStyle(neonTubeBlue)
                        .frame(width: 120, height: 50)
                        .shadow(color: lightingBlue, radius: 5)
                        .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                    Image(systemName: "water.waves")
                        .resizable()
                        .fontWeight(.regular)
                        .foregroundStyle(lightingWhite)
                        .frame(width: 120, height: 48)
                }
            }
        }
    }

    var iosdc: some View {
        let blinkLetter = "C"
        func symbolName(_ letter: String) -> SymbolName {
            switch letter {
            case "i": .iosdcI
            case "O": .iosdcO
            case "S": .iosdcS
            case "D": .iosdcD
            case "C": .iosdcC
            default: .iosdcI
            }
        }
        return HStack(spacing: 0) {
            ForEach(["i", "O", "S", "D", "C"], id: \.self) { letter in
                ZStack {
                    if letter == blinkLetter {
                        Text(letter)
                            .font(.system(size: 90, weight: .regular, design: .rounded))
                            .foregroundStyle(neonTubeCyan)
                    }
                    ZStack {
                        Text(letter)
                            .font(.system(size: 100, weight: .semibold, design: .rounded))
                            .foregroundStyle(neonTubeCyan)
                            .shadow(color: lightingCyan, radius: 5)
                            .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                            .opacity(isLighting ? 1 : 0)
                        Text(letter)
                            .matchedGeometryEffect(id: symbolName(letter), in: namespace)
                            .font(.system(size: 100, weight: .medium, design: .rounded))
                            .foregroundStyle(neonTubeCyan)
                            .shadow(color: lightingCyan, radius: 5)
                            .shadow(color: neonTubeShadow, radius: 2, x: 1, y: 1)
                            .opacity(isLighting ? 0 : 1)
                        Text(letter)
                            .font(.system(size: 95, weight: .light, design: .rounded))
                            .foregroundStyle(lightingWhite)
                    }
                    .opacity((letter == blinkLetter && isLighting) ? opacity : 1)
                    .animation(.spring(duration: 0.4, bounce: 0.75), value: opacity)
                }
            }
        }
    }
}

private extension NeonSignView {
    enum SymbolName {
        case outerCircleTop
        case outerCircleBottom
        case innerCircleTop
        case innerCircleBottom
        case innerCircleRight
        case iosdcI
        case iosdcO
        case iosdcS
        case iosdcD
        case iosdcC
        case palmTreeLeaf1
        case palmTreeLeaf2
        case palmTreeLeaf3
        case palmTreeLeaf4
        case palmTreeRight
        case microphone
        case wineGlass
        case straw
        case lemon
        case waveLeft
        case waveRight
    }

    var symbols: some View {
        let symbolSize: CGFloat = 120
        return VStack {
            HStack {
                Circle()
                    .trim(from: 0.15, to: 0.45)
                    .stroke(.symbolEyes, lineWidth: 10)
                    .matchedGeometryEffect(id: SymbolName.outerCircleTop, in: namespace)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Circle()
                    .trim(from: 0.55, to: 0.8)
                    .stroke(.symbolEyes, lineWidth: 10)
                    .matchedGeometryEffect(id: SymbolName.outerCircleBottom, in: namespace)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Circle()
                    .trim(from: 0.56, to: 0.79)
                    .stroke(.symbolEyes, lineWidth: 10)
                    .matchedGeometryEffect(id: SymbolName.innerCircleTop, in: namespace)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Circle()
                    .trim(from: 0.92, to: 1.0)
                    .stroke(.symbolEyes, lineWidth: 10)
                    .matchedGeometryEffect(id: SymbolName.innerCircleRight, in: namespace)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
            }
            HStack {
                Circle()
                    .trim(from: 0.16, to: 0.44)
                    .stroke(.symbolEyes, lineWidth: 10)
                    .matchedGeometryEffect(id: SymbolName.innerCircleBottom, in: namespace)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "moon")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.palmTreeLeaf1, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(130))
                Image(systemName: "moon")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.palmTreeLeaf2, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(155))
                Image(systemName: "moon")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.palmTreeLeaf3, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(135))
            }
            HStack {
                Image(systemName: "moon")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.palmTreeLeaf4, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(170))
                Text("ノ")
                    .matchedGeometryEffect(id: SymbolName.palmTreeRight, in: namespace)
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "wineglass")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.wineGlass, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Text("へ")
                    .matchedGeometryEffect(id: SymbolName.straw, in: namespace)
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(-45))
            }
            HStack {
                Circle()
                    .trim(from: 0.3, to: 0.97)
                    .stroke(.black, lineWidth: 7)
                    .matchedGeometryEffect(id: SymbolName.lemon, in: namespace)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "microphone")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.microphone, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "water.waves")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.waveLeft, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "water.waves")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.waveRight, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
            }
            HStack {
                Text("i")
                    .matchedGeometryEffect(id: SymbolName.iosdcI, in: namespace)
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Text("O")
                    .matchedGeometryEffect(id: SymbolName.iosdcO, in: namespace)
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Text("S")
                    .matchedGeometryEffect(id: SymbolName.iosdcS, in: namespace)
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Text("D")
                    .matchedGeometryEffect(id: SymbolName.iosdcD, in: namespace)
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
            }
            HStack {
                Text("C")
                    .matchedGeometryEffect(id: SymbolName.iosdcC, in: namespace)
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
            }
        }
    }
}
