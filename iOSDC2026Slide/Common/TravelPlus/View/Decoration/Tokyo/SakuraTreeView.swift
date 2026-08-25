//
//  SakuraTreeView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct SakuraTreeView: View {
    private let color = Color("tokyo_sakura_tree")

    var body: some View {
        ZStack {
            Text("Y")
                .font(.system(size: 130, weight: .semibold))
                .foregroundStyle(color)
            ForEach(Side.allCases, id: \.self) { side in
                Text("V")
                    .font(.system(size: 60, weight: .bold))
                    .offset(x: side.unit * 30, y: -60)
                    .foregroundStyle(color)
            }
        }
    }
}
