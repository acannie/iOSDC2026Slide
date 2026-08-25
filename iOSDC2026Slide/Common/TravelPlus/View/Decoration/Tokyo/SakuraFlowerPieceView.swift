//
//  SakuraFlowerPieceView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct SakuraFlowerPieceView: View {
    private let color: Color
    
    init(color: Color) {
        self.color = color
    }

    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 5, height: 10)
            .foregroundStyle(color)
    }
}
