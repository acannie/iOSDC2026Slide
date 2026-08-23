//
//  01_Question.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/24.
//

import SwiftUI

struct Question: View {
    @State private var count: Int = 0

    var body: some View {
        VStack {
            bubble
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.pink)
        .task {
            while true {
                try? await Task.sleep(for: .seconds(1))
                count += 1
            }
        }
    }
}

private extension Question {
    var bubble: some View {
        VStack(spacing: 32) {
            Text("イラストやアイコンを\n用意できなくて\n開発が進まない😢")
                .font(.system(size: 100, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 64)
                .padding(.vertical, 32)
                .background(
                    RoundedRectangle(cornerRadius: 64)
                        .foregroundStyle(.regularMaterial)
                )
                .padding(.horizontal, 64)
            VStack(spacing: 32) {
                Circle()
                    .fill(.regularMaterial)
                    .frame(width: 80, height: 80)
                    .offset(x: count % 2 == 1 ? -20 : 20)
                Circle()
                    .fill(.regularMaterial)
                    .frame(width: 40, height: 40)
                    .offset(x: count % 2 == 0 ? -10 : 10)
            }
        }
        .animation(.easeInOut(duration: 1), value: count)
    }

    var bear: some View {
        ZStack {
            ForEach(Side.allCases) { side in
                Ellipse()
                    .fill(.brown)
                    .offset(x: side.unit * 100, y: -120)
                    .frame(width: 100, height: 100)
            }
            Ellipse()
                .fill(.brown)
                .foregroundStyle(.brown)
                .frame(width: 300, height: 250)
        }
    }
}
