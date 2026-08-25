//
//  Kanojo2CostumeView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct Kanojo2CostumeView: CostumeView {
    private let skinColorLight = Color("kanojo2_skin_light")
    private let skinColorDark = Color("kanojo2_skin_dark")
    private let maidClothesApronColor = Color("maidClothes_apron")
    private let maidClothesShirtColor = Color("maidClothes_shirt")

    var body: some View {
        ZStack {
            neck
            clothing
        }
    }
}

private extension Kanojo2CostumeView {
    var neck: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [skinColorDark, skinColorLight]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        .mask(
            Image(systemName: "arrowshape.down.fill")
                .resizable()
                .frame(width: 200, height: 300)
                .offset(x: 0, y: 125)
        )
    }

    var clothing: some View {
        ZStack {
            // 中のシャツ
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(maidClothesShirtColor)
                .frame(width: 240, height: 450)
                .offset(x: 0, y: 375)
            // エプロン胴体
            Image(systemName: "button.roundedbottom.horizontal.fill")
                .resizable()
                .foregroundStyle(maidClothesApronColor)
                .frame(width: 230, height: 280)
                .offset(x: 0, y: 400)
            // 腕
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(skinColorLight)
                .rotationEffect(.degrees(20))
                .frame(width: 50, height: 400)
                .offset(x: 100, y: 400)
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(skinColorLight)
                .rotationEffect(.degrees(-20))
                .frame(width: 50, height: 400)
                .offset(x: -100, y: 400)
            // 左袖
            Image(systemName: "field.of.view.ultrawide.fill")
                .resizable()
                .foregroundStyle(maidClothesApronColor)
                .rotationEffect(.degrees(200))
                .frame(width: 120, height: 50)
                .offset(x: 150, y: 290)
            Image(systemName: "shield.fill")
                .resizable()
                .foregroundStyle(maidClothesShirtColor)
                .rotationEffect(.degrees(-20))
                .frame(width: 140, height: 180)
                .offset(x: 150, y: 205)
            // 右袖
            Image(systemName: "field.of.view.ultrawide.fill")
                .resizable()
                .foregroundStyle(maidClothesApronColor)
                .rotationEffect(.degrees(160))
                .frame(width: 120, height: 50)
                .offset(x: -150, y: 290)
            Image(systemName: "shield.fill")
                .resizable()
                .foregroundStyle(maidClothesShirtColor)
                .rotationEffect(.degrees(200))
                .frame(width: 140, height: 180)
                .offset(x: -150, y: 205)
            // エプロン肩紐
            Image(systemName: "speaker.fill")
                .resizable()
                .foregroundStyle(maidClothesApronColor)
                .rotationEffect(.degrees(10))
                .frame(width: 70, height: 200)
                .offset(x: 100, y: 170)
            Image(systemName: "speaker.fill")
                .resizable()
                .foregroundStyle(maidClothesApronColor)
                .rotationEffect(.degrees(170))
                .frame(width: 70, height: 200)
                .offset(x: -100, y: 170)
            // 襟
            Image(systemName: "button.angledtop.vertical.right.fill")
                .resizable()
                .foregroundStyle(maidClothesApronColor)
                .rotationEffect(.degrees(120))
                .frame(width: 50, height: 80)
                .offset(x: -45, y: 150)
            Image(systemName: "button.angledtop.vertical.left.fill")
                .resizable()
                .foregroundStyle(maidClothesApronColor)
                .rotationEffect(.degrees(-120))
                .frame(width: 50, height: 80)
                .offset(x: 45, y: 150)
            // エプロン胸
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundStyle(maidClothesApronColor)
                .frame(width: 260, height: 180)
                .offset(x: 0, y: 290)
        }
    }
}

#Preview {
    Kanojo2CostumeView()
}
