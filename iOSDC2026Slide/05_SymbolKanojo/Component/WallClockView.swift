//
//  WallClockView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/09/07.
//

import SwiftUI

struct WallClockView: View {
    @State private var count: Int = 0
    var second: Int {
        Int(count / 2)
    }

    var body: some View {
        ZStack {
            clockBody
            clockFace
                .offset(y: -100)
                .offset(y: -5)
        }
        .task {
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(0.5))
                if Task.isCancelled { break }
                count += 1
            }
        }
    }
}

private extension WallClockView {
    var clockFace: some View {
        ZStack {
            Image(systemName: "octagon.fill")
                .resizable()
                .foregroundStyle(.wallClockWoodDark)
                .frame(width: 200, height: 200)
            Circle()
                .fill(.wallClockWood)
                .frame(width: 180, height: 180)
            Circle()
                .fill(.wallClockFace)
                .frame(width: 160, height: 160)
            Circle()
                .fill(.clear)
                .stroke(.wallClockNumber, lineWidth: 1)
                .frame(width: 155, height: 155)
            Circle()
                .fill(.clear)
                .stroke(.wallClockNumber, lineWidth: 1)
                .frame(width: 150, height: 150)
            // 文字
            Group {
                ForEach(["I", "II", "III", "IV","V", "VI","VII", "VIII","IX", "X","XI", "XII"].enumerated(), id: \.offset) { index, time in
                    Text(time)
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundStyle(.wallClockNumber)
                        .scaleEffect(x: 0.6)
                        .padding(.bottom, 50)
                        .rotationEffect(.degrees(Double(index + 1) * 30), anchor: .bottom)
                }
            }
            .offset(y: -40)
            // 長針
            Group {
                VStack(spacing: -2) {
                    Image(systemName: "suit.spade.fill")
                        .resizable()
                        .foregroundStyle(.wallClockArrow)
                        .frame(width: 15, height: 30)
                    Rectangle()
                        .foregroundStyle(.wallClockArrow)
                        .frame(width: 5, height: 40)
                }
            }
            .rotationEffect(.degrees(60), anchor: .bottom)
            .offset(y: -35)
            // 短針
            Group {
                VStack(spacing: -2) {
                    Image(systemName: "suit.spade.fill")
                        .resizable()
                        .foregroundStyle(.wallClockArrow)
                        .frame(width: 15, height: 30)
                    Rectangle()
                        .foregroundStyle(.wallClockArrow)
                        .frame(width: 5, height: 20)
                }
            }
            .rotationEffect(.degrees(-60), anchor: .bottom)
            .offset(y: -25)
            // 秒針
            Rectangle()
                .foregroundStyle(.wallClockArrow)
                .frame(width: 2, height: 70)
                .rotationEffect(.degrees(CGFloat(second) * 6), anchor: .bottom)
                .animation(.easeInOut, value: second)
                .offset(y: -35)
            // 留め具
            Circle()
                .fill(.wallClockPin)
                .frame(width: 10, height: 10)
        }
    }

    var clockBody: some View {
        ZStack {
            // 背景
            Image(systemName: "shield.fill")
                .resizable()
                .foregroundStyle(.wallClockWoodDark)
                .frame(width: 130, height: 260)
            // 振り子
            VStack(spacing: -2) {
                Rectangle()
                    .foregroundStyle(.wallClockDiscDark)
                    .frame(width: 30)
                    .frame(maxHeight: .infinity)
                Circle()
                    .fill(
                        AngularGradient(
                            colors: [.wallClockDisc, .wallClockDiscDark, .wallClockDisc, .wallClockDiscDark, .wallClockDisc],
                            center: .center,
                            startAngle: .degrees(45),
                            endAngle: .degrees(405)
                        )
                    )
                    .frame(width: 70, height: 70)
            }
            .frame(height: 160)
            .rotationEffect(
                .degrees(count % 2 == 0 ? -10 : 10),
                anchor: .top
            )
            .animation(.easeInOut(duration: 0.5), value: count)
            // 枠
            Image(systemName: "shield")
                .resizable()
                .foregroundStyle(.wallClockWoodDark)
                .frame(width: 150, height: 300)
            Image(systemName: "shield")
                .resizable()
                .foregroundStyle(.wallClockWood)
                .frame(width: 130, height: 260)
        }
    }
}
