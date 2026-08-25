//
//  Kanojo2BackHairView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/21.
//

import SwiftUI

struct Kanojo2BackHairView: BackHairView {
    private let hairColorLight = Color("kanojo2_hair_light")
    private let hairColorDark = Color("kanojo2_hair_dark")

    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: hairColorLight, location: 0.0),
                .init(color: hairColorDark, location: 0.2),
                .init(color: hairColorDark, location: 0.8),
                .init(color: hairColorLight, location: 1.0)
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .mask(
            ZStack {
                // 左側
                Image(systemName: "water.waves")
                    .resizable()
                    .fontWeight(.black)
                    .rotationEffect(.degrees(100))
                    .frame(width: 200, height: 100)
                    .offset(x: -120, y: 70)
                Image(systemName: "water.waves")
                    .resizable()
                    .fontWeight(.black)
                    .rotationEffect(.degrees(100))
                    .frame(width: 200, height: 100)
                    .offset(x: -100, y: 70)
                // 中央
                Image(systemName: "water.waves")
                    .resizable()
                    .fontWeight(.black)
                    .rotationEffect(.degrees(90))
                    .frame(width: 200, height: 100)
                    .offset(x: 0, y: 70)
                // 右側
                Image(systemName: "water.waves")
                    .resizable()
                    .fontWeight(.black)
                    .rotationEffect(.degrees(80))
                    .frame(width: 200, height: 100)
                    .offset(x: 120, y: 70)
                Image(systemName: "water.waves")
                    .resizable()
                    .fontWeight(.black)
                    .rotationEffect(.degrees(80))
                    .frame(width: 200, height: 100)
                    .offset(x: 100, y: 70)
            }
        )
    }
}

#Preview {
    Kanojo2BackHairView()
}
