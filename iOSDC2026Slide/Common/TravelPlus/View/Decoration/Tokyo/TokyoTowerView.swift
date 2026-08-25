//
//  TokyoTowerView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct TokyoTowerView: View {
    private let tokyoTowerRedDark = Color("tokyo_tokyoTower_red_dark")
    private let tokyoTowerRedLight = Color("tokyo_tokyoTower_red_light")
    private let tokyoTowerWhite = Color("tokyo_tokyoTower_white")

    var body: some View {
        ZStack {
            ZStack {
                Image(systemName: "location.north.fill")
                    .resizable()
                    .foregroundStyle(tokyoTowerRedDark)
                Image(systemName: "location.north")
                    .resizable()
                    .foregroundStyle(tokyoTowerRedLight)
            }
            .frame(width: 70, height: 400)
            Image(systemName: "rectangle.split.3x1")
                .resizable()
                .frame(width: 40, height: 30)
                .foregroundStyle(tokyoTowerRedLight)
                .offset(y: 30)
            Image(systemName: "rectangle.split.3x1")
                .resizable()
                .fontWeight(.black)
                .frame(width: 60, height: 30)
                .foregroundStyle(tokyoTowerWhite)
                .offset(y: -10)
            Image(systemName: "rectangle.split.3x1")
                .resizable()
                .fontWeight(.black)
                .frame(width: 40, height: 30)
                .foregroundStyle(tokyoTowerWhite)
                .offset(y: -60)
            Image(systemName: "rectangle.split.3x1")
                .resizable()
                .fontWeight(.black)
                .frame(width: 25, height: 30)
                .foregroundStyle(tokyoTowerWhite)
                .offset(y: -110)
        }
        .offset(x: 160, y: 240)
    }
}
