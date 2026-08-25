//
//  TownView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct TownView: View {
    private let side: Side
    private let buildingColor = Color("seoul_building_main")
    private let buildingWindowColor = Color("seoul_building_window")

    init(side: Side) {
        self.side = side
    }

    var body: some View {
        ZStack {
            building(size: .init(width: 60, height: 40))
                .offset(x: side.unit * 70, y: 340)
            building(size: .init(width: 50, height: 80))
                .offset(x: side.unit * 100, y: 330)
            building(size: .init(width: 40, height: 140))
                .offset(x: side.unit * 140, y: 300)
            building(size: .init(width: 60, height: 300))
                .offset(x: side.unit * 190, y: 300)
        }
    }
}

private extension TownView {
    func building(size: CGSize) -> some View {
        VStack(spacing: size.height / 30) {
            ForEach(0..<3, id: \.self) { _ in
                Image(systemName: "text.word.spacing")
                    .resizable()
                    .frame(width: size.width, height: (size.height - 4) / 3)
                    .foregroundStyle(buildingWindowColor)
            }
        }
        .padding(size.width * 0.3)
        .background(buildingColor)
    }
}
