//
//  SaoChingchaView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct SaoChingchaView: View {
    private let color = Color("bangkok_saoChingcha")

    var body: some View {
        ZStack {
            ForEach(Side.allCases, id: \.self) { side in
                Rectangle()
                    .frame(width: 8, height: 200)
                    .rotationEffect(.degrees(side.unit * -5))
                    .foregroundStyle(color)
                    .offset(x: side.unit * 30)
                Image(systemName: "righttriangle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .rotationEffect(.degrees(side.isLeft ? -90 : 180))
                    .foregroundStyle(color)
                    .offset(x: side.unit * 30, y: -90)
                Image(systemName: "righttriangle.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .rotationEffect(.degrees(side.isLeft ? 90 : 0))
                    .foregroundStyle(color)
                    .offset(x: side.unit * 35, y: -110)
                Image(systemName: "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(color)
                    .offset(x: side.unit * 20, y: -105)
            }
            Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .frame(width: 20, height: 15)
                .offset(y: -110)
                .foregroundStyle(color)
            Rectangle()
                .frame(width: 50, height: 8)
                .foregroundStyle(color)
                .offset(y: -100)
            Rectangle()
                .frame(width: 40, height: 8)
                .foregroundStyle(color)
                .offset(y: -80)
        }
        .offset(x: 135, y: 320)
    }
}
