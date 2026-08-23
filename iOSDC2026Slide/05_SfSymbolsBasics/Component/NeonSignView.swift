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
        .offset(x: -55)
        .frame(width: 540, height: 320)
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
                    .frame(width: 300)
                    .shadow(color: lightingMagenta, radius: 5)
                    .blur(radius: 1)
                Circle()
                    .trim(from: 0.15, to: 0.45)
                    .stroke(lightingWhite, lineWidth: 5)
                    .frame(width: 300)
                // 下部
                Circle()
                    .trim(from: 0.55, to: 0.8)
                    .stroke(neonTubeMagenta, lineWidth: 10)
                    .frame(width: 300)
                    .shadow(color: lightingMagenta, radius: 5)
                    .blur(radius: 1)
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
                        .frame(width: 250)
                        .shadow(color: lightingYellow, radius: 5)
                        .blur(radius: 1)
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
                            .frame(width: 250)
                            .shadow(color: lightingOrange, radius: 5)
                            .blur(radius: 1)
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
                            .blur(radius: 1)
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
                        .frame(width: 250)
                        .shadow(color: lightingYellow, radius: 5)
                        .blur(radius: 1)
                    Circle()
                        .trim(from: 0.16, to: 0.44)
                        .stroke(lightingWhite, lineWidth: 5)
                        .frame(width: 250)
                }
            }
        }
    }

    var palmTree: some View {
        func leaf(size: CGFloat) -> some View {
            ZStack {
                Image(systemName: "moon")
                    .resizable()
                    .fontWeight(.bold)
                    .foregroundStyle(neonTubeGreen)
                    .frame(width: size, height: size)
                    .shadow(color: lightingGreen, radius: 5)
                    .blur(radius: 1)
                Image(systemName: "moon")
                    .resizable()
                    .fontWeight(.light)
                    .foregroundStyle(lightingWhite)
                    .frame(width: size - 5, height: size - 5)
            }
        }
        return ZStack {
            // 葉
            leaf(size: 75)
                .rotationEffect(.degrees(130))
                .offset(x: -65, y: -75)
            leaf(size: 80)
                .rotationEffect(.degrees(155))
                .offset(x: -45, y: -115)
            leaf(size: 75)
                .rotationEffect(.degrees(135))
                .offset(x: 35, y: -100)
            leaf(size: 70)
                .rotationEffect(.degrees(170))
                .offset(x: 35, y: -60)
            // 幹
            Group {
                Text("ノ")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundStyle(neonTubeOrange)
                    .shadow(color: lightingOrange, radius: 5)
                    .blur(radius: 1)
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
                    .fontWeight(.bold)
                    .foregroundStyle(neonTubePurple)
                    .frame(width: 70, height: 100)
                    .shadow(color: lightingPurple, radius: 5)
                    .blur(radius: 1)
                Image(systemName: "wineglass")
                    .resizable()
                    .fontWeight(.light)
                    .foregroundStyle(lightingWhite)
                    .frame(width: 65, height: 95)
            }
            // ストロー
            Group {
                Text("へ")
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundStyle(neonTubeYellow)
                    .shadow(color: lightingYellow, radius: 5)
                    .blur(radius: 1)
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
                    .frame(width: 40)
                    .shadow(color: lightingYellow, radius: 5)
                    .blur(radius: 1)
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
                .fontWeight(.semibold)
                .foregroundStyle(neonTubeYellow)
                .frame(width: 50, height: 70)
                .shadow(color: lightingYellow, radius: 5)
                .blur(radius: 1)
            Image(systemName: "microphone")
                .resizable()
                .fontWeight(.light)
                .foregroundStyle(lightingWhite)
                .frame(width: 45, height: 65)
        }
    }

    var waves: some View {
        HStack(spacing: 0) {
            ForEach(0..<2) { _ in
                ZStack {
                    Image(systemName: "water.waves")
                        .resizable()
                        .fontWeight(.black)
                        .foregroundStyle(neonTubeBlue)
                        .frame(width: 120, height: 50)
                        .shadow(color: lightingBlue, radius: 5)
                        .blur(radius: 1)
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
        return HStack(spacing: 0) {
            ForEach(["i", "O", "S", "D", "C"], id: \.self) { letter in
                ZStack {
                    if letter == blinkLetter {
                        Text(letter)
                            .font(.system(size: 90, weight: .light, design: .rounded))
                            .foregroundStyle(neonTubeCyan)
                    }
                    ZStack {
                        Text(letter)
                            .font(.system(size: 100, weight: .bold, design: .rounded))
                            .foregroundStyle(neonTubeCyan)
                            .shadow(color: lightingCyan, radius: 5)
                            .blur(radius: 1)
                        Text(letter)
                            .font(.system(size: 90, weight: .light, design: .rounded))
                            .foregroundStyle(lightingWhite)
                    }
                    .opacity((letter == blinkLetter && isLighting) ? opacity : 1)
                    .animation(.spring(duration: 0.4, bounce: 0.75), value: opacity)
                }
            }
        }
    }
}
