//
//  NeonView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct NeonView: View {
    private let neonCyan = Color("seoul_neon_cyan")
    private let neonMagenta = Color("seoul_neon_magenta")
    private let neonYellow = Color("seoul_neon_yellow")
    private let neonLightColor = Color("seoul_neon_light")

    @State private var isGameControllerNeonAnimated = false

    var body: some View {
        ZStack {
            koreaNeon
            wineglassNeon
            gameControllerNeon
        }
    }
}

private extension NeonView {
    var koreaNeon: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(neonMagenta, lineWidth: 10)
                    .shadow(color: neonMagenta, radius: 5)
                    .frame(width: 220, height: 100)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(neonLightColor, lineWidth: 6)
                    .frame(width: 220, height: 100)
            }
            HStack(spacing: 0) {
                ForEach(["대", "한", "민", "국"], id: \.self) { letter in
                    ZStack {
                        Text(letter)
                            .font(.system(size: 52, weight: .black))
                            .foregroundStyle(neonMagenta)
                            .shadow(color: neonMagenta, radius: 5)
                        Text(letter)
                            .font(.system(size: 50, weight: .semibold))
                            .foregroundStyle(neonLightColor)
                    }
                }
            }
        }
        .rotationEffect(.degrees(-15))
        .offset(x: -80, y: -320)
    }

    var wineglassNeon: some View {
        ZStack {
            Image(systemName: "wineglass")
                .resizable()
                .foregroundStyle(neonYellow)
                .shadow(color: neonYellow, radius: 5)
                .frame(width: 50, height: 100)
            Image(systemName: "wineglass")
                .resizable()
                .fontWeight(.ultraLight)
                .foregroundStyle(neonLightColor)
                .frame(width: 46, height: 96)
        }
        .rotationEffect(.degrees(10))
        .offset(x: 70, y: -270)
    }

    var gameControllerNeon: some View {
        ZStack {
            Image(systemName: "gamecontroller")
                .resizable()
                .foregroundStyle(neonCyan)
                .shadow(color: neonCyan, radius: 5)
                .frame(width: 120, height: 80)
            Image(systemName: "gamecontroller")
                .resizable()
                .fontWeight(.ultraLight)
                .foregroundStyle(neonLightColor)
                .frame(width: 116, height: 76)
        }
        .opacity(isGameControllerNeonAnimated ? 0.5 : 1)
        .rotationEffect(.degrees(30))
        .offset(x: 140, y: -340)
        .animation(
            .bouncy(duration: 1.0).delay(3.0).repeatForever(autoreverses: false),
            value: isGameControllerNeonAnimated
        )
        .onAppear {
            isGameControllerNeonAnimated = true
        }
    }
}
