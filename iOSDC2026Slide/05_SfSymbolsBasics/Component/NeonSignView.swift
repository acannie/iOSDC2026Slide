//
//  NeonSignView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/16.
//

import SwiftUI

struct NeonSignView: View {
    let count: Int

    var opacity: CGFloat {
        count % 3 == 2 ? 0 : 1
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
    }

    var circle: some View {
        ZStack {
            // 外側の円
            Group {
                // 上部
                Circle()
                    .trim(from: 0.15, to: 0.45)
                    .stroke(.neonMagenta, lineWidth: 10)
                    .frame(width: 300)
                    .shadow(color: .neonMagenta, radius: 5)
                    .blur(radius: 1)
                Circle()
                    .trim(from: 0.15, to: 0.45)
                    .stroke(.neonWhite, lineWidth: 5)
                    .frame(width: 300)
                // 下部
                Circle()
                    .trim(from: 0.55, to: 0.8)
                    .stroke(.neonMagenta, lineWidth: 10)
                    .frame(width: 300)
                    .shadow(color: .neonMagenta, radius: 5)
                    .blur(radius: 1)
                Circle()
                    .trim(from: 0.55, to: 0.8)
                    .stroke(.neonWhite, lineWidth: 5)
                    .frame(width: 300)
            }
            // 内側の円
            Group {
                // 上部
                Group {
                    Circle()
                        .trim(from: 0.56, to: 0.79)
                        .stroke(.yellow, lineWidth: 10)
                        .frame(width: 250)
                        .shadow(color: .yellow, radius: 5)
                        .blur(radius: 1)
                    Circle()
                        .trim(from: 0.56, to: 0.79)
                        .stroke(.neonWhite, lineWidth: 5)
                        .frame(width: 250)
                }
                // ヤシの幹兼円の一部
                Group {
                    Group {
                        Circle()
                            .trim(from: 0.92, to: 1.0)
                            .stroke(.neonOrange, lineWidth: 10)
                            .frame(width: 250)
                            .shadow(color: .neonOrange, radius: 5)
                            .blur(radius: 1)
                        Circle()
                            .trim(from: 0.92, to: 1.0)
                            .stroke(.neonWhite, lineWidth: 5)
                            .frame(width: 250)
                    }
                    Group {
                        Circle()
                            .trim(from: 0.0, to: 0.06)
                            .stroke(.neonOrange, lineWidth: 10)
                            .frame(width: 250)
                            .shadow(color: .neonOrange, radius: 5)
                            .blur(radius: 1)
                        Circle()
                            .trim(from: 0.0, to: 0.06)
                            .stroke(.neonWhite, lineWidth: 5)
                            .frame(width: 250)
                    }
                }
                // 下部
                Group {
                    Circle()
                        .trim(from: 0.16, to: 0.44)
                        .stroke(.yellow, lineWidth: 10)
                        .frame(width: 250)
                        .shadow(color: .yellow, radius: 5)
                        .blur(radius: 1)
                    Circle()
                        .trim(from: 0.16, to: 0.44)
                        .stroke(.neonWhite, lineWidth: 5)
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
                    .foregroundStyle(.neonGreen)
                    .frame(width: size, height: size)
                    .shadow(color: .neonGreen, radius: 5)
                    .blur(radius: 1)
                Image(systemName: "moon")
                    .resizable()
                    .fontWeight(.light)
                    .foregroundStyle(.neonWhite)
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
                    .foregroundStyle(.neonOrange)
                    .shadow(color: .cyan, radius: 5)
                    .blur(radius: 1)
                Text("ノ")
                    .font(.system(size: 80, weight: .light, design: .rounded))
                    .foregroundStyle(.neonWhite)
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
                    .foregroundStyle(.neonPurple)
                    .frame(width: 70, height: 100)
                    .shadow(color: .neonPurple, radius: 5)
                    .blur(radius: 1)
                Image(systemName: "wineglass")
                    .resizable()
                    .fontWeight(.light)
                    .foregroundStyle(.neonWhite)
                    .frame(width: 65, height: 95)
            }
            // ストロー
            Group {
                Text("へ")
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundStyle(.neonPurple)
                    .shadow(color: .neonPurple, radius: 5)
                    .blur(radius: 1)
                Text("へ")
                    .font(.system(size: 58, weight: .medium, design: .rounded))
                    .foregroundStyle(.neonWhite)
            }
            .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
            .rotationEffect(.degrees(-35))
            .offset(x: 10, y: -65)
            // レモン
            Group {
                Circle()
                    .trim(from: 0.3, to: 0.97)
                    .stroke(.yellow, lineWidth: 5)
                    .frame(width: 40)
                    .shadow(color: .neonPurple, radius: 5)
                    .blur(radius: 1)
                Circle()
                    .trim(from: 0.3, to: 0.97)
                    .stroke(.neonWhite, lineWidth: 5)
                    .frame(width: 35)
            }
            .offset(x: -30, y: -50)
        }
    }

    var microphone: some View {
        ZStack {
            Image(systemName: "microphone")
                .resizable()
                .fontWeight(.semibold)
                .foregroundStyle(.yellow)
                .frame(width: 50, height: 70)
                .shadow(color: .yellow, radius: 5)
                .blur(radius: 1)
            Image(systemName: "microphone")
                .resizable()
                .fontWeight(.light)
                .foregroundStyle(.neonWhite)
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
                        .foregroundStyle(.neonBlue)
                        .frame(width: 120, height: 50)
                        .shadow(color: .blue, radius: 5)
                        .blur(radius: 1)
                    Image(systemName: "water.waves")
                        .resizable()
                        .fontWeight(.regular)
                        .foregroundStyle(.neonWhite)
                        .frame(width: 120, height: 50)
                }
            }
        }
    }

    var iosdc: some View {
        HStack(spacing: 0) {
            ForEach(["i", "O", "S", "D", "C"], id: \.self) { letter in
                ZStack {
                    Text(letter)
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundStyle(.cyan)
                        .shadow(color: .cyan, radius: 5)
                        .blur(radius: 1)
                    Text(letter)
                        .font(.system(size: 90, weight: .light, design: .rounded))
                        .foregroundStyle(.neonWhite)
                }
                .opacity(letter == "C" ? opacity : 1)
                .animation(.spring(duration: 0.4, bounce: 0.75), value: opacity)
            }
        }
    }
}
