//
//  YuyuBackHairView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/21.
//

import SwiftUI

struct YuyuBackHairView: BackHairView {
    var body: some View {
        ZStack {
            // ハチ
            Ellipse()
                .fill(.yuyuBackHair)
                .frame(width: 310, height: 300)
                .offset(y: -125)
            // 背中の後ろに見える髪
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(.yuyuBackHair)
                .frame(width: 200, height: 600)
                .offset(y: 120)
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .foregroundStyle(.yuyuBackHair)
                    .frame(width: 200, height: 600)
                    .offset(x: side.unit * 130, y: 120)
            }
//            ForEach(Side.allCases, id: \.self) { side in
//                Image(systemName: "moon.fill")
//                    .resizable()
//                    .foregroundStyle(.yuyuBackHair)
//                    .rotationEffect(.degrees(30))
//                    .rotation3DEffect(
//                        .degrees(side == .left ? 180 : 0),
//                        axis: (x: 0, y: 1, z: 0)
//                    )
//                    .frame(width: 60, height: 400)
//                    .offset(x: side.unit * -190, y: 40)
//            }
        }
    }
}

#Preview {
    YuyuBackHairView()
}
