//
//  MtFujiView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct MtFujiView: View {
    private let fujiColorDark = Color("tokyo_fuji_dark")
    private let fujiColorLight = Color("tokyo_fuji_light")
    private let snowColor = Color("tokyo_fuji_snow")

    var body: some View {
        ZStack {
            Image(systemName: "button.angledtop.vertical.left.fill")
                .resizable()
                .foregroundStyle(fujiColorLight)
                .frame(width: 200, height: 300)
                .rotationEffect(.degrees(90))
            Image(systemName: "lines.measurement.horizontal")
                .resizable()
                .foregroundStyle(fujiColorDark)
                .frame(width: 100, height: 70)
            ZStack {
                Image(systemName: "house.lodge.fill")
                    .resizable()
                    .foregroundStyle(snowColor)
                Image(systemName: "house.lodge")
                    .resizable()
                    .foregroundStyle(snowColor)
            }
            .frame(width: 200, height: 100)
            .rotationEffect(.degrees(180))
            .offset(x: -40, y: -52)
        }
        .offset(x: -130, y: 350)
    }
}
