//
//  LotusView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct LotusView: View {
    private let lotusColor1 = Color("hoChiMinh_lotus_1")
    private let lotusColor2 = Color("hoChiMinh_lotus_2")
    private let lotusColor3 = Color("hoChiMinh_lotus_3")
    private let lotusColor4 = Color("hoChiMinh_lotus_4")
    private let lotusColor5 = Color("hoChiMinh_lotus_5")
    private let lotusLeaf = Color("hoChiMinh_lotus_leaf")

    var body: some View {
        ZStack {
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "chart.pie.fill")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .foregroundColor(lotusLeaf)
                    .rotationEffect(.degrees(side.unit * 95), anchor: .bottom)
            }
            .offset(y: -10)
            Image(systemName: "drop.fill")
                .resizable()
                .frame(width: 50, height: 100)
                .foregroundColor(lotusColor5)
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .foregroundColor(lotusColor4)
                    .rotationEffect(.degrees(side.unit * 10), anchor: .bottom)
            }
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .foregroundColor(lotusColor3)
                    .rotationEffect(.degrees(side.unit * 20), anchor: .bottom)
            }
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .foregroundColor(lotusColor2)
                    .rotationEffect(.degrees(side.unit * 40), anchor: .bottom)
            }
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 40, height: 120)
                    .foregroundColor(lotusColor1)
                    .rotationEffect(.degrees(side.unit * 70), anchor: .bottom)
                    .offset(x: side.unit * -20, y: -10)
            }
        }
    }
}
