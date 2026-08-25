//
//  Kanojo2FaceView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct Kanojo2FaceView: FaceView {
    private let skinColorLight = Color("kanojo2_skin_light")
    private let noseColor = Color.brown
    private let cheekColor = Color("kanojo2_cheek")

    var body: some View {
        ZStack {
            face
            nose
            cheeks
        }
    }
}

private extension Kanojo2FaceView {
    var face: some View {
        ZStack {
            // 頭蓋
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(skinColorLight)
                .frame(width: 280, height: 300)
                .offset(x: 0, y: -105)
            // 顎
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundColor(skinColorLight)
                .rotationEffect(.degrees(180))
                .frame(width: 190, height: 65)
                .offset(x: 0, y: 50)
            // 右頬
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundColor(skinColorLight)
                .rotationEffect(.degrees(176))
                .frame(width: 60, height: 80)
                .offset(x: -90, y: -10)
            // 左頬
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundColor(skinColorLight)
                .rotationEffect(.degrees(184))
                .frame(width: 60, height: 80)
                .offset(x: 90, y: -10)
        }
    }

    var nose: some View {
        Image(systemName: "button.angledtop.vertical.right.fill")
            .resizable()
            .foregroundStyle(noseColor)
            .frame(width: 3, height: 10)
            .offset(y: -6)
    }

    var cheeks: some View {
        ZStack {
            cheek(side: .left)
            cheek(side: .right)
        }
    }

    func cheek(side: Side) -> some View {
        ZStack {
            Image(systemName: "minus")
                .resizable()
                .foregroundStyle(cheekColor)
                .rotationEffect(.degrees(90))
                .frame(width: 33, height: 3)
                .offset(x: side.unit * 75, y: -10)
            Image(systemName: "minus")
                .resizable()
                .foregroundStyle(cheekColor)
                .rotationEffect(.degrees(side == .left ? 85 : 95))
                .frame(width: 33, height: 3)
                .offset(x: side.unit * 74, y: 28)
            Image(systemName: "cross.circle.fill")
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(cheekColor)
                .frame(width: 10, height: 10)
                .offset(x: side.unit * 75, y: 10)
        }
    }
}

#Preview {
    Kanojo2FaceView()
}
