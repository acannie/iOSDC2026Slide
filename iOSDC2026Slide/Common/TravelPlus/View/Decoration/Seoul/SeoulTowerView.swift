//
//  SeoulTowerView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct SeoulTowerView: View {
    private let color = Color("seoul_seoulTower")

    var body: some View {
        ZStack {
            Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .frame(width: 40, height: 300)
                .foregroundStyle(color)
            Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .frame(width: 60, height: 80)
                .foregroundStyle(color)
                .offset(y: -30)
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 60, height: 30)
                .foregroundStyle(color)
                .offset(y: 15)
        }
        .offset(x: 150, y: 140)
    }
}
