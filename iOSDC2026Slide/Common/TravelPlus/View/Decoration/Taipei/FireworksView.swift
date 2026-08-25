//
//  FireworksView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct FireworksView: View {
    var body: some View {
        Image(systemName: "fireworks")
            .resizable()
            .symbolRenderingMode(.palette)
            .frame(width: 150, height: 150)
            .foregroundStyle(.pink, .yellow)
            .symbolEffect(.breathe)
            .offset(x: 180, y: 100)
    }
}
