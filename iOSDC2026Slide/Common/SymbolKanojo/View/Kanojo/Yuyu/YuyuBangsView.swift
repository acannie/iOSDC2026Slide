//
//  YuyuBangsView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct YuyuBangsView: BangsView {
    var body: some View {
        ZStack {
            // エアインテーク
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "moon.fill")
                    .resizable()
                    .foregroundStyle(.yuyuFrontHair)
                    .frame(width: 100, height: 240)
                    .rotationEffect(.degrees(160))
                    .rotation3DEffect(
                        .degrees(side == .left ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .shadow(color: .white.opacity(0.6), radius: 2)
                    .offset(x: side.unit * 70, y: -160)
            }
            // 触覚
//            ForEach(Side.allCases, id: \.self) { side in
//                Image(systemName: "moon.fill")
//                    .resizable()
//                    .foregroundStyle(.yuyuFrontHair)
//                    .rotationEffect(.degrees(5))
//                    .rotation3DEffect(
//                        .degrees(side == .left ? 180 : 0),
//                        axis: (x: 0, y: 1, z: 0)
//                    )
//                    .frame(width: 60, height: 300)
//                    .offset(x: side.unit * -105, y: 30)
//            }
            // 前髪
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(210))
                .frame(width: 60, height: 160)
                .offset(x: -100, y: -140)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(190))
                .frame(width: 60, height: 180)
                .offset(x: -70, y: -170)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(185))
                .frame(width: 60, height: 180)
                .offset(x: -50, y: -170)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(185))
                .frame(width: 60, height: 200)
                .offset(x: -30, y: -160)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(185))
                .frame(width: 60, height: 220)
                .offset(x: -5, y: -165)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(-175))
                .frame(width: 60, height: 200)
                .offset(x: 20, y: -160)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(-180))
                .frame(width: 60, height: 180)
                .offset(x: 50, y: -155)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(-195))
                .frame(width: 60, height: 160)
                .offset(x: 70, y: -140)
        }
    }
}

#Preview {
    YuyuBangsView()
}
