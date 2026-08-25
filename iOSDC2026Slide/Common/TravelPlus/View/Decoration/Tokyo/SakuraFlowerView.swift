//
//  SakuraFlowerView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct SakuraFlowerView: View {
    private let color: Color

    init(color: Color) {
        self.color = color
    }

    var body: some View {
        ZStack {
            SakuraFlowerPieceView(color: color)
                .offset(x: 0, y: -7)
            SakuraFlowerPieceView(color: color)
                .rotationEffect(.degrees(72))
                .offset(x: 5, y: -2)
            SakuraFlowerPieceView(color: color)
                .rotationEffect(.degrees(144))
                .offset(x: 3, y: 4)
            SakuraFlowerPieceView(color: color)
                .rotationEffect(.degrees(216))
                .offset(x: -3, y: 4)
            SakuraFlowerPieceView(color: color)
                .rotationEffect(.degrees(288))
                .offset(x: -5, y: -2)
        }
    }
}
