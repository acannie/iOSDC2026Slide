//
//  YuyuFaceView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct YuyuFaceView: FaceView {
    @ObservedObject var vm: YuyuFaceViewModel

    @State private(set) var isMeltingAnimated: Bool = false

    private var cheekColor: Color {
        switch vm.faceType {
        case .hot: .yuyuCheekHot
        case .neutral, .melting: .yuyuCheekHot
        case .cold: .clear
        }
    }

    var body: some View {
        ZStack {
            face
            if vm.faceType == .melting {
                faceDrops
            }
            nose
            switch vm.faceType {
            case .neutral, .melting, .hot:
                cheeks
            case .cold:
                shadingLines
            }
        }
    }
}

private extension YuyuFaceView {
    var face: some View {
        ZStack {
            // 耳
            ForEach(Side.allCases, id: \.self) { side in
                Ellipse()
                    .foregroundColor(.yuyuSkinDark)
                    .rotationEffect(.degrees(-30))
                    .rotation3DEffect(
                        .degrees(side == .left ? 0 : 180),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .frame(width: 50, height: 70)
                    .offset(x: side.unit * 105, y: -30)
            }
            // はみ出た髪
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "moon.fill")
                    .resizable()
                    .foregroundStyle(.yuyuFrontHair)
                    .frame(width: 20, height: 60)
                    .rotationEffect(.degrees(45))
                    .rotation3DEffect(
                        .degrees(side == .left ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .shadow(color: .white.opacity(0.6), radius: 2)
                    .offset(x: side.unit * -125, y: -20)
            }
            // 頭蓋
            Ellipse()
                .fill(.yuyuSkin)
                .frame(width: 260, height: 300)
                .offset(x: 0, y: -105)
            // 顎・頬
            ForEach(Side.allCases, id: \.self) { side in
                Capsule()
                    .foregroundColor(.yuyuSkin)
                    .rotationEffect(.degrees(75))
                    .rotation3DEffect(
                        .degrees(side == .left ? 0 : 180),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .frame(width: 100, height: 50)
                    .offset(x: side.unit * 85, y: -30)
            }
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundColor(.yuyuSkin)
                .frame(width: 190, height: 60)
                .rotationEffect(.degrees(180))
                .offset(y: 35)
        }
    }

    var nose: some View {
        Image(systemName: "button.angledtop.vertical.right.fill")
            .resizable()
            .foregroundStyle(.yuyuNose)
            .frame(width: 3, height: 10)
            .offset(y: -6)
    }

    var cheeks: some View {
        ZStack {
            cheek(side: .left, color: cheekColor)
            cheek(side: .right, color: cheekColor)
        }
    }

    func cheek(side: Side, color: Color) -> some View {
        ZStack {
            Image(systemName: "lightspectrum.horizontal")
                .resizable()
                .foregroundStyle(color)
                .frame(width: 50, height: 20)
                .offset(x: side.unit * 80, y: -5)
        }
    }

    var shadingLines: some View {
        Image(systemName: "text.alignleft")
            .resizable()
            .rotationEffect(.degrees(90))
            .foregroundStyle(.fumiShadingLines)
            .frame(width: 40, height: 30)
            .offset(x: 75, y: -10)
    }

    var faceDrops: some View {
        var dropHeight: CGFloat {
            isMeltingAnimated ? 40 : 60
        }
        var dropOffsetY: CGFloat {
            dropHeight / 2
        }
        return ZStack {
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(.yuyuSkin)
                .frame(width: 20, height: dropHeight)
                .offset(x: -90, y: 0 + dropOffsetY)
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(.yuyuSkin)
                .frame(width: 20, height: dropHeight)
                .offset(x: -45, y: 30 + dropOffsetY)
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(.yuyuSkin)
                .frame(width: 20, height: dropHeight)
                .offset(x: 70, y: 10 + dropOffsetY)
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(.yuyuSkin)
                .frame(width: 20, height: dropHeight)
                .offset(x: 90, y: 15 + dropOffsetY)
        }
        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isMeltingAnimated)
        .onAppear {
            isMeltingAnimated = true
        }
        .onDisappear {
            isMeltingAnimated = false
        }
    }
}

#Preview {
    YuyuFaceView(vm: .init())
}
