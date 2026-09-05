//
//  YuyuCostumeView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI
import Combine

struct YuyuCostumeView: CostumeView {
    @ObservedObject var vm: YuyuCostumeViewModel

    var body: some View {
        ZStack {
            // 首の後ろに見える襟
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(.sailorPinkLight)
                .frame(width: 170, height: 50)
                .offset(y: 125)
            neck
            ForEach(Side.allCases, id: \.self) { side in
                leg(side: side)
            }
            clothing
        }
    }
}

private extension YuyuCostumeView {
//    func sailorCollarColor(_ type: CostumeType.NormalCostumeType) -> Color {
//        switch type {
//        case .normal:
//            Color("sailor_collar")
//        case .devil:
//            Color("devilSailor_collar")
//        }
//    }
//    func sailorColor(_ type: CostumeType.NormalCostumeType) -> Color {
//        switch type {
//        case .normal:
//            Color("sailor_sailor")
//        case .devil:
//            Color("devilSailor_sailor")
//        }
//    }
//    func sailorObiColor(_ type: CostumeType.NormalCostumeType) -> Color {
//        switch type {
//        case .normal:
//            Color("sailor_obi")
//        case .devil:
//            Color("devilSailor_obi")
//        }
//    }
//    func sailorObiageColor(_ type: CostumeType.NormalCostumeType) -> Color {
//        switch type {
//        case .normal:
//            Color("sailor_obiage")
//        case .devil:
//            Color("devilSailor_obiage")
//        }
//    }
//    func sailorObijimeColor1(_ type: CostumeType.NormalCostumeType) -> Color {
//        switch type {
//        case .normal:
//            Color("sailor_obijime1")
//        case .devil:
//            Color("devilSailor_obiage")
//        }
//    }
//    func sailorObijimeColor2(_ type: CostumeType.NormalCostumeType) -> Color {
//        switch type {
//        case .normal:
//            Color("sailor_obijime2")
//        case .devil:
//            Color("devilSailor_obijime2")
//        }
//    }

    var neck: some View {
        ZStack {
            Image(systemName: "arrowshape.down.fill")
                .resizable()
                .foregroundStyle(.yuyuNeckSkin)
                .frame(width: 200, height: 300)
                .offset(x: 0, y: 125)
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "righttriangle.fill")
                    .resizable()
                    .foregroundStyle(.yuyuNeckSkin)
                    .frame(width: 20, height: 100)
                    .rotationEffect(.degrees(90))
                    .rotation3DEffect(
                        .degrees(side == .left ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .offset(x: side.unit * 80, y: 120)
            }
        }
    }

    func leg(side: Side) -> some View {
        ZStack {
            // 脚
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(.yuyuSkinMiddle)
                .frame(width: 70, height: 200)
                .offset(x: side.unit * -60, y: 980)
            // 靴下
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(.socks)
                .frame(width: 80, height: 40)
                .offset(x: side.unit * -60, y: 1010)
            // 靴
            ZStack {
                Image(systemName: "shoe.fill")
                    .resizable()
                    .foregroundStyle(.shoesLight)
                Image(systemName: "shoe")
                    .resizable()
                    .foregroundStyle(.shoesDark)
            }
            .aspectRatio(contentMode: .fit)
            .rotation3DEffect(.degrees(side == .left ? 0 : 180), axis: (x: 0, y: 1, z: 0))
            .frame(width: 250)
            .offset(x: side.unit * -130, y: 1050)
        }
    }

    var clothing: some View {
        switch vm.costumeType {
        case .normal(let type):
            sailor(type)
        }
    }

    func sailor(_ type: CostumeType.NormalCostumeType) -> some View {
        ZStack {
            // 腕
            ForEach(Side.allCases, id: \.self) { side in
                Ellipse()
                    .foregroundStyle(.sailorWhiteLight)
                    .rotationEffect(.degrees(75))
                    .rotation3DEffect(
                        .degrees(side == .left ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .frame(width: 400, height: 150)
                    .offset(x: side.unit * 210, y: 340)
            }
            // 胴体
            RoundedRectangle(cornerRadius: 16)
                .fill(.sailorWhiteLight)
                .frame(width: 300, height: 300)
                .offset(y: 330)
            // リボン
            ForEach(Side.allCases, id: \.self) { side in
                Ellipse()
                    .foregroundStyle(.sailorPinkDark)
                    .rotationEffect(.degrees(45))
                    .rotation3DEffect(
                        .degrees(side == .left ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .frame(width: 200, height: 80)
                    .offset(x: side.unit * -80, y: 260)
            }
            Ellipse()
                .foregroundStyle(.sailorPinkDark)
                .frame(width: 80, height: 300)
                .offset(y: 470)
            RoundedRectangle(cornerRadius: 4)
                .fill(.sailorPinkLight)
                .frame(width: 70, height: 40)
                .offset(y: 350)
            // 襟
            Group {
                Image(systemName: "field.of.view.ultrawide.fill")
                    .resizable()
                    .foregroundStyle(.sailorWhiteLight)
                    .frame(width: 200, height: 150)
                crest
                    .frame(width: 200, height: 150)
                    .offset(y: -30)
            }
            .offset(y: 240)
            ForEach(Side.allCases, id: \.self) { side in
                ZStack {
                    Image(systemName: "righttriangle.fill")
                        .resizable()
                        .foregroundStyle(.sailorPinkLight)
                        .frame(width: 150, height: 250)
                        .rotationEffect(.degrees(200))
                        .rotation3DEffect(
                            .degrees(side == .left ? 180 : 0),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .offset(x: side.unit * 100, y: 230)
                    // 上側の線
                    Capsule()
                        .fill(.sailorWhite)
                        .frame(width: 10, height: 250)
                        .rotationEffect(.degrees(230))
                        .rotation3DEffect(
                            .degrees(side == .left ? 180 : 0),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .offset(x: side.unit * 95, y: 210)
                    // 下側の線
                    Capsule()
                        .fill(.sailorWhite)
                        .frame(width: 10, height: 280)
                        .rotationEffect(.degrees(230))
                        .rotation3DEffect(
                            .degrees(side == .left ? 180 : 0),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .offset(x: side.unit * 100, y: 230)
                }
            }
        }
    }

    var crest: some View {
        ZStack {
            Group {
                Ellipse()
                    .trim(from: 0.0, to: 0.5)
                    .fill(.sailorPinkDark)
                Ellipse()
                    .stroke(.sailorPinkDark, lineWidth: 1)
            }
            .frame(width: 35, height: 40)
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "crown.fill")
                    .resizable()
                    .foregroundStyle(.sailorPinkDark)
                    .frame(width: 15, height: 5)
                    .rotationEffect(.degrees(side.unit * 15))
                    .offset(x: side.unit * 5)
            }
            .offset(y: -24)
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: side.isLeft ? "laurel.leading" : "laurel.trailing")
                    .resizable()
                    .fontWeight(.black)
                    .foregroundStyle(.sailorPinkDark)
                    .frame(width: 10, height: 30)
                    .rotationEffect(.degrees(side.unit * 20))
                    .offset(x: side.unit * 20, y: 10)
            }
            Group {
                Image(systemName: "teddybear.fill")
                    .resizable()
                    .foregroundStyle(.sailorWhiteLight)
                    .frame(width: 18, height: 20)
                Image(systemName: "teddybear")
                    .resizable()
                    .foregroundStyle(.sailorPinkDark)
                    .frame(width: 18, height: 20)
            }
            .offset(y: 4)
            Image(systemName: "heart")
                .resizable()
                .fontWeight(.bold)
                .foregroundStyle(.sailorPinkDark)
                .frame(width: 8, height: 8)
                .offset(y: -12)
        }
    }
}

#Preview {
    YuyuCostumeView(vm: YuyuCostumeViewModel())
}
