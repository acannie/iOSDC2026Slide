//
//  WomanView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct WomanView: View {
    private let hairColor = Color("hoChiMinh_woman_hair")
    private let aozaiColor = Color("hoChiMinh_woman_aozai")
    private let skinColor = Color("hoChiMinh_woman_skin")
    private let nonLaColor = Color.brown

    @State private var isHairAnimated = false

    var body: some View {
        ZStack {
        // 顔
        Ellipse()
            .frame(width: 50, height: 50)
            .foregroundStyle(skinColor)
            .offset(x: 20, y: 10)
        Rectangle()
            .frame(width: 30, height: 20)
            .foregroundStyle(skinColor)
            .offset(x: 20, y: 35)
        // アオザイ
        Image(systemName: "arrowtriangle.down.fill")
            .resizable()
            .frame(width: 70, height: 140)
            .foregroundStyle(aozaiColor)
            .offset(x: 20, y: 120)
        Image(systemName: "arrowtriangle.up.fill")
            .resizable()
            .frame(width: 100, height: 150)
            .foregroundStyle(aozaiColor)
            .offset(x: 20, y: 160)
        Rectangle()
            .frame(width: 40, height: 10)
            .foregroundStyle(aozaiColor)
            .offset(x: 20, y: 45)
        // 髪
        Ellipse()
            .frame(width: 30, height: 60)
            .foregroundStyle(hairColor)
            .offset(x: 20, y: 10)
        Group {
            Image(systemName: "capsule.portrait.fill")
                .resizable()
                .frame(width: 60,height: 100)
                .foregroundStyle(hairColor)
                .offset(y: 70)
            Image(systemName: "drop.fill")
                .resizable()
                .rotationEffect(.degrees(180))
                .frame(width: 20, height: 30)
                .foregroundStyle(hairColor)
                .offset(y: 130)
        }
        .rotationEffect(.degrees(isHairAnimated ? 2 : -2), anchor: .top)
        .animation(
            .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
            value: isHairAnimated
        )
        .onAppear {
            isHairAnimated = true
        }
        // 笠
        Image(systemName: "field.of.view.ultrawide.fill")
            .resizable()
            .frame(width: 150, height: 70)
            .rotationEffect(.degrees(150))
            .foregroundStyle(nonLaColor)
        }
        .offset(x: 140, y: 200)
    }
}
