//
//  ElephantView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct ElephantView: View {
    private let colorDark = Color("bangkok_elephant_dark")
    private let colorLight = Color("bangkok_elephant_light")
    private let eyeColor = Color("bangkok_elephant_eye")
    private let fangColor = Color("bangkok_elephant_fang")
    private let saddleColor = Color("bangkok_elephant_saddle")

    @State private var isElephantAnimated = false

    var body: some View {
        ZStack {
            Image(systemName: "button.angledbottom.horizontal.right.fill")
                .resizable()
                .rotationEffect(.degrees(180))
                .frame(width: 180, height: 120)
                .foregroundStyle(colorLight)
            Rectangle()
                .frame(width: 30, height: 60)
                .foregroundStyle(colorLight)
                .offset(x: 60, y: 80)
            Rectangle()
                .frame(width: 30, height: 60)
                .foregroundStyle(colorLight)
                .offset(x: -35, y: 80)
            Rectangle()
                .frame(width: 30, height: 60)
                .foregroundStyle(colorLight)
                .offset(x: -70, y: 80)
            Rectangle()
                .frame(width: 30, height: 40)
                .foregroundStyle(colorLight)
                .rotationEffect(.degrees(-45))
                .offset(x: 90, y: 50)
            // 動く前足
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 30, height: 40)
                .foregroundStyle(colorLight)
                .rotationEffect(.degrees(isElephantAnimated ? 0 : 15), anchor: .topTrailing)
                .offset(x: 100, y: 70)
            // 尾
            Text("ノ")
                .font(.system(size: 60, weight: .bold))
                .foregroundStyle(colorLight)
                .rotationEffect(.degrees(isElephantAnimated ? 0 : 15), anchor: .topTrailing)
                .offset(x: -95, y: 5)
            // 頭
            Image(systemName: "button.angledtop.vertical.left.fill")
                .resizable()
                .rotationEffect(.degrees(90))
                .frame(width: 80, height: 100)
                .foregroundStyle(colorLight)
                .offset(x: 70, y: -20)
            // 鼻
            Text("つ")
                .font(.system(size: 60, weight: .black))
                .foregroundStyle(colorLight)
                .rotationEffect(.degrees(isElephantAnimated ? 45 : 0), anchor: .topLeading)
                .offset(x: 140, y: 20)
            // 目
            Circle()
                .foregroundStyle(eyeColor)
                .frame(width: 10, height: 10)
                .offset(x: 80, y: -30)
            // 牙
            Image(systemName: "moon.fill")
                .resizable()
                .rotationEffect(.degrees(-30))
                .frame(width: 40, height: 40)
                .foregroundStyle(fangColor)
                .offset(x: 90, y: 15)
            // 鞍
            Image(systemName: "crown.fill")
                .resizable()
                .rotationEffect(.degrees(165))
                .frame(width: 80, height: 70)
                .foregroundStyle(saddleColor)
                .offset(x: -25, y: -15)
            // 耳
            Image(systemName: "button.angledtop.vertical.right.fill")
                .resizable()
                .frame(width: 50, height: 70)
                .foregroundStyle(colorDark)
                .rotationEffect(.degrees(180))
                .offset(x: 25, y: -20)
        }
        .offset(x: -150, y: 320)
        .animation(
            .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
            value: isElephantAnimated
        )
        .onAppear {
            isElephantAnimated = true
        }
    }
}
