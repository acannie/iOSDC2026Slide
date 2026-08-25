//
//  FumiCostumeView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI
import Combine

struct FumiCostumeView: CostumeView {
    @ObservedObject var vm: FumiCostumeViewModel

    private let skinColor = Color("fumi_skin")
    private let neckSkinColor = Color("fumi_neckSkin")
    private let skinColorMiddle = Color("fumi_skin_middle")
    private let shoesColorLight = Color("shoes_light")
    private let shoesColorDark = Color("shoes_dark")
    private let socksColor = Color("socks")

    var body: some View {
        ZStack {
            neck
            ForEach(Side.allCases, id: \.self) { side in
                leg(side: side)
            }
            clothing
        }
    }
}

private extension FumiCostumeView {
    func kimonoCollarColor(_ type: CostumeType.NormalCostumeType) -> Color {
        switch type {
        case .normal:
            Color("kimono_collar")
        case .devil:
            Color("devilKimono_collar")
        }
    }
    func kimonoColor(_ type: CostumeType.NormalCostumeType) -> Color {
        switch type {
        case .normal:
            Color("kimono_kimono")
        case .devil:
            Color("devilKimono_kimono")
        }
    }
    func kimonoObiColor(_ type: CostumeType.NormalCostumeType) -> Color {
        switch type {
        case .normal:
            Color("kimono_obi")
        case .devil:
            Color("devilKimono_obi")
        }
    }
    func kimonoObiageColor(_ type: CostumeType.NormalCostumeType) -> Color {
        switch type {
        case .normal:
            Color("kimono_obiage")
        case .devil:
            Color("devilKimono_obiage")
        }
    }
    func kimonoObijimeColor1(_ type: CostumeType.NormalCostumeType) -> Color {
        switch type {
        case .normal:
            Color("kimono_obijime1")
        case .devil:
            Color("devilKimono_obiage")
        }
    }
    func kimonoObijimeColor2(_ type: CostumeType.NormalCostumeType) -> Color {
        switch type {
        case .normal:
            Color("kimono_obijime2")
        case .devil:
            Color("devilKimono_obijime2")
        }
    }

    var neck: some View {
        Image(systemName: "arrowshape.down.fill")
            .resizable()
            .foregroundStyle(neckSkinColor)
            .frame(width: 200, height: 300)
            .offset(x: 0, y: 125)
    }

    func leg(side: Side) -> some View {
        ZStack {
            // 脚
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(skinColorMiddle)
                .frame(width: 70, height: 200)
                .offset(x: side.unit * -60, y: 980)
            // 靴下
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(socksColor)
                .frame(width: 80, height: 40)
                .offset(x: side.unit * -60, y: 1010)
            // 靴
            ZStack {
                Image(systemName: "shoe.fill")
                    .resizable()
                    .foregroundStyle(shoesColorLight)
                Image(systemName: "shoe")
                    .resizable()
                    .foregroundStyle(shoesColorDark)
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
            kimono(type)
        }
    }

    func kimono(_ type: CostumeType.NormalCostumeType) -> some View {
        ZStack {
            // 下半身
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(kimonoColor(type))
                .frame(width: 130, height: 600)
                .offset(x: 65, y: 700)
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(kimonoColor(type))
                .frame(width: 100, height: 500)
                .offset(x: 0, y: 700)
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(kimonoColor(type))
                .frame(width: 80, height: 600)
                .offset(x: -90, y: 700)
            // 襟の続き
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(kimonoCollarColor(type))
                .frame(width: 40, height: 530)
                .offset(x: -60, y: 650)
            // めくれ
            Image(systemName: "righttriangle.fill")
                .resizable()
                .rotationEffect(.degrees(-90))
                .foregroundStyle(kimonoCollarColor(type))
                .frame(width: 100, height: 100)
                .offset(x: -25, y: 948)
            // 胴体
            Image(systemName: "squareshape.fill")
                .resizable()
                .foregroundStyle(kimonoColor(type))
                .frame(width: 265, height: 320)
                .offset(x: 0, y: 360)
            // おはしょりに見える襟
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(kimonoCollarColor(type))
                .frame(width: 40, height: 200)
                .offset(x: -70, y: 420)
            // 左肩
            Image(systemName: "button.angledtop.vertical.right.fill")
                .resizable()
                .foregroundStyle(kimonoColor(type))
                .frame(width: 200, height: 300)
                .offset(x: 120, y: 265)
            // 右肩
            Image(systemName: "button.angledtop.vertical.left.fill")
                .resizable()
                .foregroundStyle(kimonoColor(type))
                .frame(width: 200, height: 300)
                .offset(x: -120, y: 265)
            // 後襟
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(kimonoCollarColor(type))
                .rotationEffect(.degrees(-30))
                .frame(width: 40, height: 120)
                .offset(x: -30, y: 155)
            // 前襟
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(kimonoCollarColor(type))
                .rotationEffect(.degrees(30))
                .frame(width: 40, height: 270)
                .offset(x: -15, y: 220)
            // 帯
            Image(systemName: "squareshape.fill")
                .resizable()
                .foregroundStyle(kimonoObiColor(type))
                .frame(width: 265, height: 180)
                .offset(x: 0, y: 400)
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundStyle(kimonoObiageColor(type))
                    .frame(width: 130, height: 20)
                    .offset(x: side.unit * 65, y: 310)
            }
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(kimonoObiageColor(type))
                .frame(width: 30, height: 20)
                .offset(x: 0, y: 310)
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundStyle(kimonoObijimeColor2(type))
                    .frame(width: 130, height: 10)
                    .offset(x: side.unit * 65, y: 390)
            }
            Image(systemName: "link.circle.fill")
                .resizable()
                .foregroundStyle(kimonoObijimeColor1(type))
                .frame(width: 15, height: 15)
                .offset(x: 0, y: 390)
        }
    }
}

#Preview {
    FumiCostumeView(vm: FumiCostumeViewModel())
}
