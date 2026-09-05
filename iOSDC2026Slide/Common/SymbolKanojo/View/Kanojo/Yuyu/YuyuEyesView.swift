//
//  YuyuEyesView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct YuyuEyesView: EyesView {
    @ObservedObject var vm: YuyuEyesViewModel

    var body: some View {
        ZStack {
            eye(vm.leftEyeType, side: .left)
            eye(vm.rightEyeType, side: .right)
        }
    }
}

private extension YuyuEyesView {
    @ViewBuilder
    func eye(_ eyeType: EyeType, side: Side) -> some View {
        switch eyeType {
        case .normal(let expressionType, let irisType, let irisPosition):
            normalEye(irisType, irisPosition: irisPosition, side: side, expressionType: expressionType)
        case .close:
            closedEye(side: side)
        case .closeTightly:
            tightlyClosedEye(side: side)
        case .laughter:
            laughterEye(side: side)
        }
    }

    func normalEye(_ irisType: EyeType.IrisType, irisPosition: EyeType.IrisPosition, side: Side, expressionType: EyeType.ExpressionType) -> some View {
        ZStack {
            // 白目
            Image(systemName: "button.angledbottom.horizontal.right.fill")
                .resizable()
                .foregroundStyle(.yuyuWhiteOfEyes)
                .rotationEffect(
                    Angle(degrees: side.unit * 20.0) + expressionType.eyeAngle(side: side)
                )
                .frame(width: 70, height: 60.0 + expressionType.eyeHeight)
                .offset(x: side.unit * 70, y: -50)
            // 黒目
            iris(irisType, irisPosition: irisPosition, side: side)
            // アイライン
            Image(systemName: "phone.down.fill")
                .resizable()
                .foregroundStyle(.yuyuEyelash)
                .rotationEffect(
                    Angle(degrees: side.unit * 7.0) + expressionType.eyeAngle(side: side)
                )
                .frame(width: 95, height: 18)
                .offset(x: side.unit * 80, y: -75 + expressionType.upperEyelashesOffsetY)
            // 二重線
            Image(
                systemName: side == .left ? "button.angledtop.vertical.left.fill" : "button.angledtop.vertical.right.fill")
                .resizable()
                .foregroundStyle(.yuyuSkinDark)
                .rotationEffect(
                    Angle(degrees: side == .left ? 85 : 275) + expressionType.eyeAngle(side: side)
                )
                .frame(width: 3, height: 70)
                .offset(x: side.unit * 80, y: -85 + expressionType.upperEyelashesOffsetY)
            // 上まつ毛
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .foregroundStyle(.yuyuEyelash)
                .rotationEffect(
                    Angle(degrees: side.unit * 95) + expressionType.eyeAngle(side: side)
                )
                .frame(width: 15, height: 25)
                .offset(x: side.unit * 90, y: -85 + expressionType.upperEyelashesOffsetY)
            // 下まつ毛
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .foregroundStyle(.yuyuEyelash)
                .rotationEffect(.degrees(side.unit * 80))
                .frame(width: 5, height: 25)
                .offset(x: side.unit * 85, y: -25 + expressionType.lowerEyelashesOffsetY)
        }
    }

    func iris(_ irisType: EyeType.IrisType, irisPosition: EyeType.IrisPosition, side: Side) -> some View {
        let originalIrisOffset = CGPoint(x: side.unit * 65, y: -50)
        let irisOffset = irisPosition.irisOffset
        return ZStack {
            iris
            switch irisType {
            case .heart:
                heart(side: side)
            case .dizzy:
                swirl(side: side)
            case .star:
                star(side: side)
            case .knockout:
                xmark(side: side)
            case .money:
                dollar(side: side)
            case .normal, .teary:
                defaultIris
            case .lifeless:
                EmptyView()
            }
            if irisType == .teary {
                teary
            }
        }
        .offset(
            x: originalIrisOffset.x + irisOffset.x,
            y: originalIrisOffset.y + irisOffset.y
        )
        .ios18Animation(.wiggle, isActive: irisType == .teary)
    }

    func closedEye(side: Side) -> some View {
        ZStack {
            // 瞼
            Image(systemName: "field.of.view.ultrawide.fill")
                .resizable()
                .rotationEffect(.degrees(side.unit * 7))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.yuyuSkin, .yuyuSkinDark],
                        startPoint: side == .left ? .trailing : .leading,
                        endPoint: side == .left ? .leading : .trailing
                    )
                )
                .frame(width: 90, height: 40)
                .offset(x: side.unit * 80, y: -45)
            // アイライン
            Image(systemName: "heart.fill")
                .resizable()
                .rotationEffect(.degrees(side.unit * 7))
                .foregroundStyle(.yuyuEyelash)
                .frame(width: 90, height: 17)
                .offset(x: side.unit * 75, y: -35)
            // まつ毛
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .fontWeight(.thin)
                .foregroundStyle(.yuyuEyelash)
                .rotationEffect(.degrees(side.unit * -98))
                .frame(width: 10, height: 25)
                .offset(x: side.unit * 100, y: -27)
        }
    }

    func laughterEye(side: Side) -> some View {
        ZStack {
            // 瞼
            Image(systemName: "field.of.view.ultrawide.fill")
                .resizable()
                .rotationEffect(.degrees(side.unit * 7))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.yuyuSkin, .yuyuSkinDark],
                        startPoint: side == .left ? .trailing : .leading,
                        endPoint: side == .left ? .leading : .trailing
                    )
                )
                .frame(width: 90, height: 20)
                .offset(x: side.unit * 80, y: -50)
            // アイライン
            Image(systemName: "heart.fill")
                .resizable()
                .rotationEffect(.degrees(side.unit * 187))
                .foregroundStyle(.yuyuEyelash)
                .frame(width: 90, height: 17)
                .offset(x: side.unit * 75, y: -40)
            // まつ毛
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .fontWeight(.thin)
                .foregroundStyle(.yuyuEyelash)
                .rotationEffect(.degrees(side.unit * -260))
                .frame(width: 10, height: 25)
                .offset(x: side.unit * 92, y: -46)
        }
    }

    func tightlyClosedEye(side: Side) -> some View {
        ZStack {
            Image(systemName: side == .left ? "chevron.right" : "chevron.left")
                .resizable()
                .fontWeight(.bold)
                .foregroundStyle(.yuyuEyelash)
                .frame(width: 90, height: 50)
                .offset(x: side.unit * 65, y: -40)
        }
    }

    func swirl(side: Side) -> some View {
        Image(systemName: "at")
            .resizable()
            .foregroundStyle(.red)
            .frame(width: 40, height: 50)
            .ios18Animation(.rotate)
    }

    func heart(side: Side) -> some View {
        Image(systemName: "heart.fill")
            .resizable()
            .rotationEffect(.degrees(side.unit * 5))
            .frame(width: 40, height: 30)
            .foregroundStyle(.red)
            .ios18Animation(.bounce)
    }

    func star(side: Side) -> some View {
        Image(systemName: "star.fill")
            .resizable()
            .rotationEffect(.degrees(side.unit * 5))
            .frame(width: 50, height: 50)
            .foregroundStyle(.fumiEyeStar)
            .ios18Animation(.bounce)
    }

    func xmark(side: Side) -> some View {
        Image(systemName: "cross.fill")
            .resizable()
            .rotationEffect(.degrees(45.0 + side.unit * 5))
            .frame(width: 40, height: 40)
            .foregroundStyle(.fumiEyeKnockout)
            .ios18Animation(.bounce)
    }

    var teary: some View {
        Image(systemName: "circle.grid.2x1.fill")
            .resizable()
            .frame(width: 45, height: 6)
            .foregroundStyle(.yuyuEyeShine)
            .offset(y: 7)
    }

    func dollar(side: Side) -> some View {
        Image(systemName: "dollarsign")
            .resizable()
            .fontWeight(.black)
            .rotationEffect(.degrees(side.unit * 5))
            .frame(width: 30, height: 30)
            .foregroundStyle(.fumiEyeDollar)
            .ios18Animation(.bounce)
    }

    var defaultIris: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .foregroundStyle(
                LinearGradient(
                    gradient: Gradient(colors: [.yuyuIrisMiddle, .yuyuIrisLight]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .symbolRenderingMode(.multicolor)
            .frame(width: 50, height: 55)
    }

    var iris: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .foregroundStyle(
                LinearGradient(
                    gradient: Gradient(colors: [.yuyuIrisMiddle, .yuyuIrisLight]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 50, height: 55)
    }
}

#Preview {
    YuyuEyesView(vm: .init())
}
