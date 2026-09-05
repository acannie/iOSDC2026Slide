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
            // 背中の後ろに見える髪
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .foregroundStyle(.yuyuBackHair)
                    .frame(width: 200, height: 600)
                    .offset(x: side.unit * 100, y: 120)
            }
        }
    }
}

#Preview {
    YuyuBackHairView()
}
