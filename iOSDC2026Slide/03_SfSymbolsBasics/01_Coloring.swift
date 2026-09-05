//
//  01_Coloring.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct Coloring: View {
    @State private var count: Int = 0
    @State private var isAnimated: Bool = false
    @State private var sunColor: Color = .yellow
    @State private var cloudColor: Color = .cyan

    private static let sunAndCloudColors: [Color] = [
        .red,
        .orange,
        .yellow,
        .green,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .pink,
        .brown,
        .gray,
    ]

    var body: some View {
        VStack {
            HStack {
                title
                Spacer()
            }
            .padding(.leading, 64)
            .padding(.top, 64)
            HStack(spacing: 200) {
                rainbow
                teddybear
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .task {
            while true {
                try? await Task.sleep(for: .seconds(1))
                count += 1

                // 雲と太陽の色を決める
                var cloudColor: Color?
                var sunColor: Color?
                while sunColor == nil || sunColor == self.sunColor {
                    sunColor = Self.sunAndCloudColors.randomElement()
                }
                while cloudColor == nil || cloudColor == self.cloudColor || cloudColor == sunColor {
                    cloudColor = Self.sunAndCloudColors.randomElement()
                }
                self.sunColor = sunColor ?? .red
                self.cloudColor = cloudColor ?? .blue
            }
        }
        .onAppear {
            isAnimated = true
        }
        .onDisappear {
            isAnimated = false
        }
    }

    var title: some View {
        Text("着色する")
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundStyle(.commonText)
    }

    var rainbow: some View {
        VStack(spacing: 32) {
            Image(systemName: "cloud.sun.fill")
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(sunColor, cloudColor)
                .scaledToFit()
                .frame(width: 500, height: 300)
                .animation(.easeInOut, value: count)
            Text("cloud.sun.fill")
                .font(.system(size: 50, weight: .bold, design: .rounded))
        }
    }

    var teddybear: some View {
        let spacing: CGFloat = 40
        let teddybearOutlineWidth: CGFloat = 200
        let teddybearFillWidth: CGFloat = 195
        let offset: CGFloat = (teddybearOutlineWidth + teddybearFillWidth) / 4 + spacing / 2
        return VStack(spacing: 32) {
            HStack(spacing: spacing) {
                Image(systemName: "teddybear.fill")
                    .resizable()
                    .foregroundStyle(.teddybearFill)
                    .frame(width: teddybearFillWidth, height: 235)
                    .keyframeAnimator(initialValue: 0.0, repeating: true) { content, offsetValue in
                        content
                            .offset(x: offsetValue)
                    } keyframes: { _ in
                        KeyframeTrack {
                            CubicKeyframe(offset, duration: 2.0)
                            LinearKeyframe(offset, duration: 1.0)
                            MoveKeyframe(0.0)
                        }
                    }
                Image(systemName: "teddybear")
                    .resizable()
                    .fontWeight(.heavy)
                    .foregroundStyle(.teddybearOutline)
                    .frame(width: teddybearOutlineWidth, height: 245)
                    .keyframeAnimator(initialValue: 0.0, repeating: true) { content, offsetValue in
                        content
                            .offset(x: -offsetValue)
                    } keyframes: { _ in
                        KeyframeTrack {
                            CubicKeyframe(offset, duration: 2.0)
                            LinearKeyframe(offset, duration: 1.0)
                            MoveKeyframe(0.0)
                        }
                    }
            }
            VStack(spacing: 12) {
                Text("teddybear.fill")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundStyle(.commonText)
                Text("teddybear")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundStyle(.commonText)
            }
        }
    }
}
