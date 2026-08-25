//
//  FenceView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct FenceView: View {
    private let color = Color("taipei_fence")

    var body: some View {
        Image(systemName: "rectangle.split.3x1")
            .resizable()
            .frame(width: 200, height: 100)
            .foregroundStyle(color)
            .offset(x: 20, y: 400)
    }
}
