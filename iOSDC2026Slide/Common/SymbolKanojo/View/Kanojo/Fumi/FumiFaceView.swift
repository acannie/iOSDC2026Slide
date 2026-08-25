//
//  FumiFaceView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct FumiFaceView: FaceView {
    @ObservedObject var vm: FumiFaceViewModel

    @State private(set) var isMeltingAnimated: Bool = false

    private let skinColor = Color("fumi_skin")
    private let noseColor = Color("fumi_nose")
    private let cheekColorNeutral = Color("fumi_cheek_neutral")
    private let cheekColorHot = Color("fumi_cheek_hot")
    private let shadingLinesColor = Color("fumi_shadingLines")

    private var cheekColor: Color {
        switch vm.faceType {
        case .hot:
            cheekColorHot
        case .neutral, .melting:
            cheekColorNeutral
        case .cold:
            .clear
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

private extension FumiFaceView {
    var face: some View {
        ZStack {
            // 頭蓋
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(skinColor)
                .frame(width: 280, height: 300)
                .offset(x: 0, y: -105)
            // 顎
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundColor(skinColor)
                .rotationEffect(.degrees(180))
                .frame(width: 212, height: 65)
                .offset(x: 0, y: 50)
            // 頬
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "righttriangle.fill")
                    .resizable()
                    .foregroundColor(skinColor)
                    .rotationEffect(.degrees(-50))
                    .rotation3DEffect(
                        .degrees(side == .left ? 0 : 180),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .frame(width: 60, height: 90)
                    .offset(x: side.unit * 110, y: -15)
            }
            // 頬の穴埋め
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundStyle(skinColor)
                    .frame(width: 30, height: 30)
                    .offset(x: side.unit * 80, y: 20)
            }
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
            cheek(side: .left, color: cheekColor)
            cheek(side: .right, color: cheekColor)
        }
    }

    func cheek(side: Side, color: Color) -> some View {
        ZStack {
            Image(systemName: "lightspectrum.horizontal")
                .resizable()
                .foregroundStyle(color)
                .frame(width: 50, height: 40)
                .offset(x: side.unit * 80, y: -5)
        }
    }

    var shadingLines: some View {
        Image(systemName: "text.alignleft")
            .resizable()
            .rotationEffect(.degrees(90))
            .foregroundStyle(shadingLinesColor)
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
                .foregroundStyle(skinColor)
                .frame(width: 20, height: dropHeight)
                .offset(x: -90, y: 0 + dropOffsetY)
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(skinColor)
                .frame(width: 20, height: dropHeight)
                .offset(x: -45, y: 30 + dropOffsetY)
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(skinColor)
                .frame(width: 20, height: dropHeight)
                .offset(x: 70, y: 10 + dropOffsetY)
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(skinColor)
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
    FumiFaceView(vm: .init())
}
