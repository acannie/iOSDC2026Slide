//
//  FanView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/17.
//

import SwiftUI

struct FanView: View {
    let isActive: Bool
    @State private var count: Int = 0
    @State private var isOn: Bool = false

    var body: some View {
        ZStack {
            fanBody
            fanHead
        }
        .frame(width: 450, height: 750)
        .offset(y: -200)
        .task {
            while true {
                try? await Task.sleep(for: .seconds(0.1))
                count += 1
            }
        }
        .onChange(of: isActive) {
            isOn = false
        }
    }

    var fanBody: some View {
        ZStack {
            // 台上面
            Rectangle()
                .fill(.fanBodyMiddle)
                .frame(width: 355, height: 180)
                .rotation3DEffect(.degrees(30), axis: (1, 0, 0))
                .offset(y: 435)
            // 操作パネル
            RoundedRectangle(cornerRadius: 12)
                .fill(.fanPanel)
                .frame(width: 270, height: 70)
                .rotation3DEffect(.degrees(30), axis: (1, 0, 0))
                .offset(y: 475)
            RoundedRectangle(cornerRadius: 8)
                .stroke(.fanBodyMiddle, lineWidth: 3)
                .frame(width: 260, height: 60)
                .rotation3DEffect(.degrees(30), axis: (1, 0, 0))
                .offset(y: 475)
            // スイッチ
            Button(
                action: {
                    isOn.toggle()
                },
                label: {
                    ZStack {
                        Circle()
                            .fill(.fanSteelMiddle)
                            .frame(width: 40, height: 40)
                        Capsule()
                            .fill(.fanSteelLight)
                            .frame(width: 30, height: 5)
                    }
                    .rotationEffect(.degrees(isOn ? 95 : 0))
                    .animation(.bouncy, value: isOn)
                }
            )
            .offset(x: -80, y: 475)
            // 飾りボタン
            HStack(spacing: 10) {
                ForEach(0..<4) { _ in
                    Circle()
                        .fill(.fanSteelMiddle)
                        .frame(width: 20, height: 40)
                }
            }
            .offset(x: 40, y: 480)
            // 首
            Rectangle()
                .fill(.fanBodyDark)
                .frame(width: 70, height: 400)
                .rotation3DEffect(.degrees(30), axis: (1, 0, 0))
                .offset(y: 200)
            // 台側面
            Rectangle()
                .fill(.fanBodyDark)
                .frame(width: 405, height: 50)
                .offset(y: 550)
        }
    }

    var fanHead: some View {
        let degreesStep: Double = 6
        let wireCount: Int = Int((180 / degreesStep).rounded())
        return ZStack {
            // 羽
            Image(systemName: "fan.fill")
                .resizable()
                .foregroundStyle(.fanFan.opacity(0.8))
                .frame(width: 330, height: 330)
                .rotationEffect(.degrees(isOn ? CGFloat(count) * 180 : 0))
                .animation(.easeInOut(duration: 5.0), value: count)
            // 骨組み
            ForEach(0..<wireCount) { index in
                Rectangle()
                    .fill(.fanSteelMiddle)
                    .frame(width: 5, height: 400)
                    .rotationEffect(.degrees(CGFloat(index) * degreesStep))
            }
            // 外側の枠
            Circle()
                .stroke(.fanSteelMiddle, lineWidth: 5)
                .frame(width: 400, height: 400)
            // 内側の枠
            Circle()
                .stroke(.fanSteelMiddle, lineWidth: 5)
                .frame(width: 300, height: 300)
            // 中心の円盤
            Circle()
                .fill(.fanSteelMiddle)
                .frame(width: 100, height: 100)
            Circle()
                .stroke(.fanSteelLight, lineWidth: 3)
                .frame(width: 80, height: 80)
        }
    }
}
