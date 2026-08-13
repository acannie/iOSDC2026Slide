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

    var body: some View {
        VStack {
            title
            HStack {
//                Text("Coloring \(count)")
//                    .font(.system(size: 100))
//                    .foregroundStyle(color(for: count))
//                    .animation(.easeInOut, value: count)
                teddybear
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .task {
            while true {
                try? await Task.sleep(for: .seconds(1))
                count += 1
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
        HStack {
            Text("着色する")
                .font(.system(size: 100))
            Spacer()
        }
        .padding(.horizontal, 48)
    }

    func color(for index: Int) -> Color {
        Color(hue: .random(in: 0...1), saturation: 1, brightness: 1)
    }

    var teddybear: some View {
        let spacing: CGFloat = 40
        let teddybearOutlineWidth: CGFloat = 200
        let teddybearFillWidth: CGFloat = 195
        let offset: CGFloat = (teddybearOutlineWidth + teddybearFillWidth) / 4 + spacing / 2
        return HStack(spacing: spacing) {
            Image(systemName: "teddybear.fill")
                .resizable()
                .foregroundStyle(.teddybearFill)
                .frame(width: teddybearFillWidth, height: 235)
                .shadow(color: .teddybearFill, radius: 4)
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
                .foregroundStyle(.teddybearOutline)
                .frame(width: teddybearOutlineWidth, height: 240)
                .shadow(color: .teddybearOutline, radius: 4)
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
    }
}
