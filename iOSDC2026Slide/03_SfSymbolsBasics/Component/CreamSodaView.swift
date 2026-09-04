//
//  CreamSodaView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/09/05.
//

import SwiftUI

struct CreamSodaView: View {
    let isShowingGraphic: Bool
    @State private var count: Int = 0

    var body: some View {
        ZStack {
            // メロンソーダ
            Image(systemName: "wineglass.fill")
                .resizable()
                .fontWeight(.thin)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.melonsodaMiddle, .melonsodaDark],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 290, height: 500)
            // スプーン
            ZStack {
                Capsule()
                    .fill(.spoon)
                    .frame(width: 10, height: 200)
                    .rotationEffect(.degrees(170))
                    .offset(x: -22, y: -130)
                Image(systemName: "spoon.serving")
                    .resizable()
                    .foregroundStyle(.spoon)
                    .scaledToFit()
                    .frame(width: 30)
                    .rotationEffect(.degrees(170))
            }
            .rotationEffect(.degrees(count % 2 == 0 ? -5 : 5))
            .animation(.easeInOut(duration: 1.0), value: count)
            .offset(x: -55, y: -140)
            // 氷
            Group {
                // 上段
                iceCube(size: 60, angle: -30)
                    .offset(x: -80, y: -60 - iceCubePosition)
                iceCube(size: 70, angle: -10)
                    .offset(y: -100 + iceCubePosition)
                iceCube(size: 60, angle: 20)
                    .offset(x: 70, y: -70 - iceCubePosition)
                // 下段
                iceCube(size: 70, angle: 30)
                    .offset(x: -45, y: -35 + iceCubePosition)
                iceCube(size: 80, angle: -5)
                    .offset(x: 35, y: -15 - iceCubePosition)
            }
            .animation(.easeInOut(duration: 1.0), value: iceCubePosition)
            // 泡
            ZStack {
                ForEach(0..<30, id: \.self) { index in
                    let delay = Double.random(in: 0..<5)
                    let yOffset = Double.random(in: 0..<40)
                    Circle()
                        .stroke(.white.opacity(isShowingGraphic ? 1 : 0))
                        .fill(.clear)
                        .frame(width: 10)
                        .offset(x: -100 + CGFloat(index) * 7, y: 10)
                        .keyframeAnimator(initialValue: 0.0, repeating: true) { content, offsetValue in
                            content
                                .offset(y: -offsetValue)
                        } keyframes: { _ in
                            KeyframeTrack {
                                LinearKeyframe(yOffset, duration: delay)
                                LinearKeyframe(yOffset, duration: 2.0)
                                CubicKeyframe(190 - yOffset, duration: 2.0)
                                LinearKeyframe(190 - yOffset, duration: 1.0)
                                MoveKeyframe(0.0)
                            }
                        }
                        .keyframeAnimator(initialValue: 0.0, repeating: true) { content, offsetValue in
                            content
                                .opacity(offsetValue)
                        } keyframes: { _ in
                            KeyframeTrack {
                                LinearKeyframe(0.0, duration: delay)
                                LinearKeyframe(1, duration: 2.0)
                                CubicKeyframe(1, duration: 2.0)
                                LinearKeyframe(0, duration: 1.0)
                                MoveKeyframe(0.0)
                            }
                        }
                }
            }
            // グラスの底
            ZStack {
                Ellipse()
                    .fill(.background)
                Ellipse()
                    .fill(.thinMaterial)
            }
            .frame(width: 200, height: 60)
            .offset(y: 205)
            // グラスの縁
            Image(systemName: "wineglass")
                .resizable()
                .fontWeight(.thin)
                .foregroundStyle(.thinMaterial)
                .frame(width: 300, height: 500)
            // アイスクリーム
            ZStack {
                Circle()
                    .trim(from: 0.5, to: 1.0)
                    .fill(.melonsodaIceCream)
                    .frame(width: 165)
                Ellipse()
                    .fill(.melonsodaIceCream)
                    .frame(width: 165, height: 30)
            }
            .offset(x: -5, y: -215)
            // さくらんぼ
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.cherryMiddle, .cherryMiddle, .cherryDark],
                            startPoint: .topTrailing,
                            endPoint: .bottomLeading
                        )
                    )
                    .frame(width: 60)
                Text("ノ")
                    .font(.system(size: 120, weight: .thin))
                    .foregroundStyle(.cherryDark)
                    .rotationEffect(.degrees(180))
                    .offset(x: 35, y: -55)
            }
            .offset(x: 50, y: -290)
        }
        .frame(width: 300, height: 600)
        .task(id: isShowingGraphic) {
            if isShowingGraphic {
                while !Task.isCancelled {
                    try? await Task.sleep(for: .seconds(1))
                    if Task.isCancelled { break }
                    count += 1
                }
            } else {
                count = 0
            }
        }
    }
}

private extension CreamSodaView {
    var iceCubePosition: CGFloat {
        count % 2 == 0 ? 0 : 15
    }

    var bubblePosition: CGFloat {
        switch (count * 3) % 2 {
        case 0: 0
        default: -100
        }
    }

    var bubbleOpacity: CGFloat {
        switch count % 6 {
        case 0, 1, 2, 3: 1
        default: 0
        }
    }

    func iceCube(size: CGFloat, angle: CGFloat) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.ultraThinMaterial)
                .frame(width: size, height: size)
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.white, .clear, .clear],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: size - 10, height: size - 10)
        }
        .rotationEffect(.degrees(angle))
    }
}
