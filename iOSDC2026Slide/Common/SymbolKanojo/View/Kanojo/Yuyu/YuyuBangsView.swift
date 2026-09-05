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
            // 横髪
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "moon.fill")
                    .resizable()
                    .foregroundStyle(.yuyuFrontHair)
                    .rotation3DEffect(
                        .degrees(side == .left ? 180 : 0), axis: (x: 0, y: 90, z: 0)
                    )
                    .rotationEffect(.degrees(side.unit * 30))
                    .frame(width: 60, height: 200)
                    .offset(x: side.unit * -115, y: -140)
            }
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundStyle(.yuyuFrontHair)
                    .frame(width: 90, height: 60)
                    .offset(x: side.unit * 80, y: -220)
            }
            // ケモミミ
            ForEach(Side.allCases, id: \.self) { side in
                animalEars(side: side)
            }
            // 前髪サイド
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "moon.fill")
                    .resizable()
                    .foregroundStyle(.yuyuFrontHair)
                    .rotation3DEffect(
                        .degrees(side == .left ? 180 : 0), axis: (x: 0, y: 90, z: 0)
                    )
                    .rotationEffect(.degrees(side.unit * -20))
                    .frame(width: 60, height: 300)
                    .offset(x: side.unit * 110, y: -150)
            }
            // 触覚
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "moon.fill")
                    .resizable()
                    .foregroundStyle(.yuyuFrontHair)
                    .rotation3DEffect(
                        .degrees(side == .left ? 180 : 0), axis: (x: 0, y: 90, z: 0)
                    )
                    .frame(width: 60, height: 300)
                    .offset(x: side.unit * -110, y: 80)
            }
            // 前髪
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(200))
                .frame(width: 60, height: 200)
                .offset(x: -70, y: -180)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(190))
                .frame(width: 60, height: 200)
                .offset(x: -50, y: -180)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(180))
                .frame(width: 60, height: 200)
                .offset(x: -30, y: -180)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(180))
                .frame(width: 60, height: 200)
                .offset(x: 0, y: -180)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(-180))
                .frame(width: 60, height: 200)
                .offset(x: 30, y: -180)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(.yuyuFrontHair)
                .rotationEffect(.degrees(-190))
                .frame(width: 60, height: 200)
                .offset(x: 50, y: -160)
        }
    }

    func animalEars(side: Side) -> some View {
        ZStack {
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundStyle(.fumiAnimalEarGray)
                .rotationEffect(.degrees(side.unit * 55))
                .frame(width: 150, height: 80)
                .offset(x: side.unit * 130, y: -190)
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundStyle(.fumiAnimalEarPink)
                .rotationEffect(.degrees(side.unit * 55))
                .frame(width: 100, height: 60)
                .offset(x: side.unit * 120, y: -185)
        }
    }
}

#Preview {
    YuyuBangsView()
}
