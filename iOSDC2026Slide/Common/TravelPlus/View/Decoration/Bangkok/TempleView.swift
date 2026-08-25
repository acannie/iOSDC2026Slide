//
//  TempleView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct TempleView: View {
    private let colorLight = Color("bangkok_temple_light")
    private let colorDark = Color("bangkok_temple_dark")

    var body: some View {
        ZStack {
            Image(systemName: "mappin")
                .resizable()
                .frame(width: 10, height: 30)
                .foregroundStyle(colorLight)
                .offset(y: -120)
            Image(systemName: "bell.fill")
                .resizable()
                .frame(width: 80, height: 100)
                .foregroundStyle(colorLight)
            Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .frame(width: 40, height: 120)
                .foregroundStyle(colorLight)
                .offset(y: -50)
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .rotationEffect(.degrees(180))
                .frame(width: 40, height: 40)
                .foregroundStyle(colorDark)
                .offset(y: -57)
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .rotationEffect(.degrees(180))
                .frame(width: 35, height: 40)
                .foregroundStyle(colorDark)
                .offset(y: -65)
            Rectangle()
                .foregroundStyle(colorDark)
                .frame(width: 140, height: 40)
                .offset(y: 40)
        }
        .offset(x: 70, y: 380)
    }
}
