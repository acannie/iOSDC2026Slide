//
//  WindowView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/09/07.
//

import SwiftUI

struct WindowView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // カーテンレール
                Rectangle()
                    .fill(.curtainRail)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                ZStack {
                    VStack(spacing: 16) {
                        ForEach(0..<2) { row in
                            HStack(spacing: 16) {
                                ForEach(0..<2) { column in
                                    ZStack(alignment: .bottom) {
                                        Rectangle()
                                            .fill(.outsideSky)
                                        if row == 1 {
                                            Capsule()
                                                .fill(.outsidePlant)
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 100)
                                            HStack {
                                                if column == 1 {
                                                    Spacer()
                                                }
                                                Capsule()
                                                    .fill(.outsidePlant)
                                                    .frame(width: 200, height: 200)
                                                if column == 0 {
                                                    Spacer()
                                                }
                                            }
                                        }
                                        Rectangle()
                                            .fill(.regularMaterial)
                                    }
                                }
                            }
                        }
                    }
                    .padding(20)
                    .background(.windowEdge)
                    stainedGlass
                    // ステンドグラス上下左右の装飾
                    Group {
                        HStack(spacing: 0) {
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.windowStainedGlassPink)
                                    .frame(width: 70, height: 40)
                                Rectangle()
                                    .fill(.windowStainedGlassYellow)
                                    .frame(width: 70)
                                    .frame(maxHeight: .infinity)
                                Rectangle()
                                    .fill(.windowStainedGlassPink)
                                    .frame(width: 70, height: 40)
                            }
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.windowStainedGlassPurple)
                                    .frame(height: 40)
                                    .frame(maxWidth: .infinity)
                                Spacer()
                                Rectangle()
                                    .fill(.windowStainedGlassPurple)
                                    .frame(height: 40)
                                    .frame(maxWidth: .infinity)
                            }
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.windowStainedGlassPink)
                                    .frame(width: 70, height: 40)
                                Rectangle()
                                    .fill(.windowStainedGlassYellow)
                                    .frame(width: 70)
                                    .frame(maxHeight: .infinity)
                                Rectangle()
                                    .fill(.windowStainedGlassPink)
                                    .frame(width: 70, height: 40)
                            }
                        }
                    }
                    .padding(20)
                    // ステンドグラス上下左右装飾の枠線
                    Group {
                        HStack(spacing: 0) {
                            Rectangle()
                                .fill(.windowEdge)
                                .frame(width: 6)
                                .frame(maxHeight: .infinity)
                                .padding(.leading, 70)
                            Spacer()
                            Rectangle()
                                .fill(.windowEdge)
                                .frame(width: 6)
                                .frame(maxHeight: .infinity)
                                .padding(.trailing, 70)
                        }
                        VStack(spacing: 0) {
                            Rectangle()
                                .fill(.windowEdge)
                                .frame(height: 6)
                                .frame(maxWidth: .infinity)
                                .padding(.top, 40)
                            Spacer()
                            Rectangle()
                                .fill(.windowEdge)
                                .frame(height: 6)
                                .frame(maxWidth: .infinity)
                                .padding(.bottom, 40)
                        }
                    }
                    .padding(20)
                    HStack {
                        stainedGlassTriangle(isPlantColor: false)
                            .rotationEffect(.degrees(90))
                        Spacer()
                        VStack {
                            stainedGlassTriangle(isPlantColor: false)
                                .rotationEffect(.degrees(180))
                            Spacer()
                            stainedGlassTriangle(isPlantColor: true)
                        }
                        Spacer()
                        stainedGlassTriangle(isPlantColor: false)
                            .rotationEffect(.degrees(270))
                    }
                }
            }
            .padding(.top, 8)
            .padding(.bottom, 32)
            .padding(.horizontal, 32)
            HStack {
                curtain
                Spacer()
                curtain
            }
        }
        .frame(width: 600, height: 600)
    }
}

private extension WindowView {
    var curtain: some View{
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        .curtainDark, .curtainLight, .curtainDark, .curtainLight,.curtainDark, .curtainLight,.curtainDark, .curtainLight,.curtainDark
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(width: 100, height: 600)
    }

    var rose: some View {
        var petal: some View {
            ZStack {
                Image(systemName: "moon.fill")
                    .resizable()
                    .foregroundStyle(.windowRosePetal)
                    .padding(4)
                Image(systemName: "moon")
                    .resizable()
                    .fontWeight(.bold)
                    .foregroundStyle(.windowEdge)
            }
            .frame(width: 80, height: 80)
        }
        var outerPetal: some View {
            ZStack {
                Image(systemName: "hexagon.tophalf.filled")
                    .resizable()
                    .foregroundStyle(.windowRosePetal)
                    .padding(4)
                Image(systemName: "hexagon")
                    .resizable()
                    .fontWeight(.black)
                    .foregroundStyle(.windowEdge)
            }
            .frame(width: 80, height: 80)
        }
        return ZStack {
            outerPetal
                .offset(y: -20)
            outerPetal
                .rotationEffect(.degrees(135))
                .offset(x: 20, y: 20)
            outerPetal
                .rotationEffect(.degrees(230))
                .offset(x: -20, y: 20)
            Circle()
                .fill(.windowRosePetal)
                .frame(width: 80, height: 80)
            petal
            petal
                .rotationEffect(.degrees(90))
            petal
                .rotationEffect(.degrees(180))
            petal
                .rotationEffect(.degrees(250))
        }
    }

    var stainedGlass: some View {
        var leaf: some View {
            ZStack {
                Image(systemName: "leaf.fill")
                    .resizable()
                    .fontWeight(.black)
                    .foregroundStyle(.windowRoseLeaf)
                    .padding(4)
                Image(systemName: "leaf")
                    .resizable()
                    .fontWeight(.heavy)
                    .foregroundStyle(.windowEdge)
            }
        }
        return ZStack {
            leaf
                .frame(width: 80, height: 80)
                .rotationEffect(.degrees(-70))
                .offset(x: -30, y: 30)
            leaf
                .frame(width: 80, height: 80)
                .rotationEffect(.degrees(5))
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .offset(x: 40, y: -40)
            rose
                .offset(y: -30)
        }
    }

    func stainedGlassTriangle(isPlantColor: Bool) -> some View {
        ZStack {
            Image(systemName: "triangleshape.fill")
                .resizable()
                .foregroundStyle(.windowEdge)
            Group {
                Image(systemName: "triangleshape.fill")
                    .resizable()
                    .foregroundStyle(isPlantColor ? .outsidePlant : .outsideSky)
                Image(systemName: "triangleshape.fill")
                    .resizable()
                    .foregroundStyle(.regularMaterial)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        .frame(width: 120, height: 60)
        .padding(.bottom, 16)
    }
}
