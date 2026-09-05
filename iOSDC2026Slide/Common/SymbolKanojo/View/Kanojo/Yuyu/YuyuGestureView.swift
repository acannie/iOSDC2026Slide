//
//  YuyuGestureView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

import SwiftUI

struct YuyuGestureView: GestureView {
    @ObservedObject var vm: YuyuGestureViewModel

    private var kimonoColor: Color {
        switch vm.costumeType {
        case .normal(let normalCostumeType):
            switch normalCostumeType {
            case .normal: .kimonoKimono
            case .devil: .devilKimonoKimono
            }
        }
    }

    var body: some View {
        ZStack {
            hand(side: .left)
            hand(side: .right)
        }
    }
}

private extension YuyuGestureView {
    @ViewBuilder
    func hand(side: Side) -> some View {
        let gestureType = side == .left ? vm.leftHandGestureType : vm.rightHandGestureType
        switch gestureType {
        case .palmOutFront(let type):
            palmOutFront(type, side: side)
        case .backhandOutFront(let type):
            backhandOutFront(type, side: side)
        case .thumbIndexUp(let type):
            thumbIndexUp(type, side: side)
        case .shushFinger(let type):
            shushFinger(type, side: side)
        }
    }

    func palmOutFront(_ type: GestureType.PalmOutFrontType, side: Side) -> some View {
        let handAngle: CGFloat = switch type {
        case .waving: 30
        case .salute: -60
        }
        let handPosition: CGPoint = switch type {
        case .waving: .init(x: 140, y: 100)
        case .salute: .init(x: 120, y: -120)
        }
        let handWidth: CGFloat = switch type {
        case .waving: 140
        case .salute: 70
        }
        let kimonoPosition: CGPoint = switch type {
        case .waving: .init(x: 160, y: 350)
        case .salute: .init(x: 230, y: 160)
        }
        let kimonoWidth: CGFloat = switch type {
        case .waving: 200
        case .salute: 160
        }
        let kimonoHeight: CGFloat = switch type {
        case .waving: 400
        case .salute: 520
        }
        return ZStack {
            Image(systemName: side == .left ? "button.angledtop.vertical.left.fill" : "button.angledtop.vertical.right.fill")
                .resizable()
                .foregroundStyle(kimonoColor)
                .frame(width: kimonoWidth, height: kimonoHeight)
                .offset(x: side.unit * kimonoPosition.x, y: kimonoPosition.y)
            Image(
                systemName: "hand.raised.fingers.spread.fill")
                .resizable()
                .foregroundStyle(.yuyuSkin)
                .rotation3DEffect(
                    .degrees(side == .left ? 0 : 180),
                    axis: (x: 0, y: 1, z: 0)
                )
                .rotationEffect(.degrees(side.unit * handAngle))
                .frame(width: handWidth, height: 190)
                .offset(x: side.unit * handPosition.x, y: handPosition.y)
        }
    }

    func backhandOutFront(_ type: GestureType.BackhandOutFrontType, side: Side) -> some View {
        let handAngle: CGFloat = switch type {
        case .normal: -165
        case .coverEyes: -10
        case .coverMouth: -30
        case .faceHoldShock: 30
        }
        let handPosition: CGPoint = switch type {
        case .normal: .init(x: 80, y: 510)
        case .coverEyes: .init(x: 60, y: -20)
        case .coverMouth: .init(x: 0, y: 80)
        case .faceHoldShock: .init(x: 120, y: 30)
        }
        let handWidthScale: CGFloat = switch type {
        case .faceHoldShock: 0.5
        default: 1.0
        }
        let kimonoAngle: CGFloat = switch type {
        case .normal: -160
        default: 0
        }
        let kimonoPosition: CGPoint = switch type {
        case .normal: .init(x: 125, y: 400)
        case .coverEyes: .init(x: 120, y: 260)
        case .coverMouth: .init(x: 100, y: 350)
        case .faceHoldShock: .init(x: 140, y: 280)
        }
        let kimonoWidth: CGFloat = switch type {
        case .normal: 150
        case .coverEyes: 200
        case .coverMouth: 230
        case .faceHoldShock: 160
        }
        let kimonoHeight: CGFloat = switch type {
        case .normal: 210
        case .coverEyes: 400
        case .coverMouth: 400
        case .faceHoldShock: 400
        }
        return ZStack {
            ZStack {
                // 手の甲
                Image(systemName: "hand.raised.fingers.spread.fill")
                    .resizable()
                    .foregroundStyle(.yuyuSkinMiddle)
                    .frame(width: 140 * handWidthScale, height: 190)
                // 爪
                nail
                    .rotationEffect(.degrees(16))
                    .frame(width: 15 * handWidthScale, height: 21)
                    .offset(x: 62 * handWidthScale, y: -4)
                nail
                    .rotationEffect(.degrees(5))
                    .frame(width: 16 * handWidthScale, height: 24)
                    .offset(x: 33 * handWidthScale, y: -70)
                nail
                    .rotationEffect(.degrees(-1))
                    .frame(width: 16 * handWidthScale, height: 24)
                    .offset(x: -1 * handWidthScale, y: -83)
                nail
                    .rotationEffect(.degrees(-10))
                    .frame(width: 16 * handWidthScale, height: 24)
                    .offset(x: -34 * handWidthScale, y: -70)
                nail
                    .rotationEffect(.degrees(-10))
                    .frame(width: 14 * handWidthScale, height: 24)
                    .offset(x: -62 * handWidthScale, y: -52)
            }
            .rotation3DEffect(
                .degrees(side == .left ? 180 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .rotationEffect(.degrees(side.unit * handAngle))
            .offset(x: side.unit * handPosition.x, y: handPosition.y)
            // 着物
            Image(systemName: side == .left ? "button.angledtop.vertical.left.fill" : "button.angledtop.vertical.right.fill")
                .resizable()
                .foregroundStyle(kimonoColor)
                .rotationEffect(.degrees(side.unit * kimonoAngle))
                .frame(width: kimonoWidth, height: kimonoHeight)
                .offset(x: side.unit * kimonoPosition.x, y: kimonoPosition.y)
        }
    }

    func thumbIndexUp(_ type: GestureType.ThumbIndexUpType, side: Side) -> some View {
        ZStack{
            ZStack {
                // 手
                Image(systemName: side == .left ? "hand.point.right.fill" : "hand.point.left.fill")
                    .resizable()
                    .foregroundStyle(.yuyuSkinMiddle)
                // 爪
                nail
                    .rotationEffect(.degrees(side.unit * -60))
                    .frame(width: 15, height: 21)
                    .offset(x: 7, y: -65)
                nail
                    .rotationEffect(.degrees(side.unit * 90))
                    .frame(width: 16, height: 24)
                    .offset(x: 78, y: -23)
            }
            .frame(width: 190, height: 140)
            .rotationEffect(.degrees(side.unit * 50))
            .offset(x: side.unit * -30, y: 100)
            Image(systemName: side == .left ? "button.angledtop.vertical.left.fill" : "button.angledtop.vertical.right.fill")
                .resizable()
                .foregroundStyle(kimonoColor)
                .frame(width: 250, height: 400)
                .offset(x: side.unit * 90, y: 350)
        }
    }

    func shushFinger(_ type: GestureType.ShushFingerType, side: Side) -> some View {
        ZStack {
            Image(systemName: side == .left ? "button.angledtop.vertical.left.fill" : "button.angledtop.vertical.right.fill")
                .resizable()
                .foregroundStyle(kimonoColor)
                .frame(width: 230, height: 400)
                .offset(x: side.unit * 100, y: 350)
            ZStack {
                // 手
                Image(systemName: "hand.point.up.fill")
                    .resizable()
                    .foregroundStyle(.yuyuSkinMiddle)
                    .frame(width: 140, height: 190)
                // 爪
                nail
                    .rotationEffect(.degrees(side.unit * -15))
                    .frame(width: 16, height: 24)
                    .offset(x: 5, y: 38)
                nail
                    .rotationEffect(.degrees(side.unit * -10))
                    .frame(width: 16, height: 24)
                    .offset(x: 30, y: 40)
                nail
                    .rotationEffect(.degrees(side.unit * -10))
                    .frame(width: 14, height: 24)
                    .offset(x: 55, y: 35)
            }
            .rotation3DEffect(
                .degrees(side == .left ? 180 : 0),
                axis: (x: 0, y: 90, z: 0)
            )
            .rotationEffect(.degrees(side.unit * -10))
            .offset(x: side.unit * 30, y: 100)
        }
    }

    var nail: some View {
        Image(systemName: "capsule.portrait.fill")
            .resizable()
            .foregroundStyle(.yuyuNail)
    }
}

#Preview {
    YuyuGestureView(vm: .init())
}
