//
//  Kanojo2BangsView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct Kanojo2BangsView: BangsView {
    private let hairColorLight = Color("kanojo2_hair_light")
    private let hairColorMiddle = Color("kanojo2_hair_middle")
    private let headgearColor = Color("kanojo2_headgear")
    private let headgearLightColor = Color("kanojo2_headgearLight")
    private let headgearOutlineColor = Color("kanojo2_headgearOutline")

    var body: some View {
        ZStack {
            headgear(side: .left)
            headgear(side: .right)
            // 髪
            RadialGradient(
                gradient: Gradient(colors: [hairColorMiddle, hairColorLight, hairColorMiddle]),
                center: .top,
                startRadius: 50,
                endRadius: 300
            )
            .mask(
                ZStack {
                    // ハチ周り
                    Image(systemName: "moon.fill")
                        .resizable()
                        .rotationEffect(.degrees(130))
                        .frame(width: 260, height: 260)
                        .offset(x: 0, y: -165)
                    // 触覚
                    Image(systemName: "lane")
                        .resizable()
                        .frame(width: 260, height: 300)
                        .offset(x: 0, y: 20)
                    // 前髪
                    Image(systemName: "button.angledtop.vertical.left.fill")
                        .resizable()
                        .rotationEffect(.degrees(270))
                        .frame(width: 150, height: 200)
                        .offset(x: 30, y: -170)
                }
            )
        }
    }
}

private extension Kanojo2BangsView {
    /// 頭の両隣の飾り
    func headgear(side: Side) -> some View {
        ZStack {
            Image(systemName: "poweron")
                .resizable()
                .foregroundStyle(headgearColor)
                .frame(width: 10, height: 70)
                .offset(x: side.unit * 170, y: -170)
            Image(systemName: "archivebox.fill")
                .resizable()
                .foregroundStyle(headgearColor)
                .rotationEffect(.degrees(side.unit * -90))
                .frame(width: 150, height: 70)
                .offset(x: side.unit * 160, y: -90)
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(headgearLightColor)
                .rotationEffect(.degrees(side.unit * -90))
                .frame(width: 20, height: 20)
                .offset(x: side.unit * 170, y: -200)
                .shadow(color: headgearLightColor, radius: 4)
        }
    }
}

#Preview {
    Kanojo2BangsView()
}
