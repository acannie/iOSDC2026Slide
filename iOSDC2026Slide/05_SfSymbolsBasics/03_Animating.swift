//
//  03_Animating.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct Animating: View {
    let isActive: Bool
    @State private var count: Int = 0
    @State private var isAnimated: Bool = false

    var body: some View {
        VStack {
            title
            HStack(spacing: 50) {
//                creamSoda
                eye
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .task {
            while true {
                try? await Task.sleep(for: .seconds(1))
                count += 1
            }
        }
        .onChange(of: isActive) {
            isAnimated = isActive
        }
    }

    var title: some View {
        HStack {
            Text("アニメーションさせる")
                .font(.system(size: 100))
            Spacer()
        }
        .padding(.horizontal, 48)
    }

    var creamSoda: some View {
        VStack(spacing: 32) {
            Image(systemName: "glass")
            Text("クリームソーダ")
                .font(.system(size: 50, weight: .bold))
        }
    }

    func iris(_ irisType: EyeType.IrisType, irisPosition: EyeType.IrisPosition) -> some View {
        let originalIrisOffset = CGPoint(x: 325, y: -250)
        let irisOffset = irisPosition.irisOffset
        return ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.irisMiddle, .irisLight]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 250, height: 275)
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.irisMiddle, .irisLight]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .symbolRenderingMode(.multicolor)
                .frame(width: 250, height: 275)
        }
        .offset(
            x: originalIrisOffset.x + irisOffset.x,
            y: originalIrisOffset.y + irisOffset.y
        )
    }

    var eye: some View {
        var eyeAngle: Double {
            switch count % 3 {
            case 0: 0
            case 1: 15
            case 2: -15
            default: 0
            }
        }
        func eyebrowAngle(_ angle: Angle) -> Angle {
            let eyebrowType = EyebrowType.neutral
            return switch eyebrowType {
            case .neutral, .surprise:
                angle
            case .anger:
                angle + Angle(degrees: 15.0)
            case .sadness:
                angle + Angle(degrees: -10.0)
            }
        }

        func eyebrowOffsetY(_ offsetY: CGFloat) -> CGFloat {
            let eyebrowType = EyebrowType.neutral
            return switch eyebrowType {
            case .neutral, .anger, .sadness:
                offsetY
            case .surprise:
                offsetY - 50.0
            }
        }
        let expressionType = EyeType.ExpressionType.neutral
        let irisType = EyeType.IrisType.normal
        let irisPosition = EyeType.IrisPosition.center
        return VStack(spacing: 32) {
            ZStack {
                // 白目
                Image(systemName: "button.angledbottom.horizontal.right.fill")
                    .resizable()
                    .foregroundStyle(.whiteOfEyes)
                    .rotationEffect(
                        Angle(degrees: 20.0) + expressionType.eyeAngle
                    )
                    .frame(width: 350, height: 300.0 + expressionType.eyeHeight)
                    .offset(x: 350, y: -250)
                // 黒目
                iris(irisType, irisPosition: irisPosition)
                // アイライン
                Image(systemName: "phone.down.fill")
                    .resizable()
                    .foregroundStyle(.eyelash)
                    .rotationEffect(
                        Angle(degrees: 7.0) + expressionType.eyeAngle
                    )
                    .frame(width: 475, height: 90)
                    .offset(x: 400, y: -375 + expressionType.upperEyelashesOffsetY)
                // 二重線
                Image(systemName: "button.angledtop.vertical.right.fill")
                    .resizable()
                    .foregroundStyle(.skinDark)
                    .rotationEffect(
                        Angle(degrees: 275) + expressionType.eyeAngle
                    )
                    .frame(width: 15, height: 350)
                    .offset(x: 400, y: -425 + expressionType.upperEyelashesOffsetY)
                // 上まつ毛
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .foregroundStyle(.eyelash)
                    .rotationEffect(
                        Angle(degrees: 95) + expressionType.eyeAngle
                    )
                    .frame(width: 75, height: 125)
                    .offset(x: 450, y: -425 + expressionType.upperEyelashesOffsetY)
                // 下まつ毛
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .foregroundStyle(.eyelash)
                    .rotationEffect(.degrees(80))
                    .frame(width: 25, height: 125)
                    .offset(x: 425, y: -125 + expressionType.lowerEyelashesOffsetY)
                // 眉毛
                Image(systemName: "button.angledtop.vertical.left.fill")
                    .resizable()
                    .foregroundStyle(.eyebrow)
                    .rotationEffect(eyebrowAngle(
                        Angle(degrees: 95)
                    ))
                    .frame(width: 25, height: 350)
                    .offset(
                        x: 350,
                        y: eyebrowOffsetY(-550)
                    )
            }
            .offset(x: -350, y: 300)
        }
        .background(
            Ellipse()
                .fill(.skin)
                .frame(width: 600, height: 700)
                .offset(x: 20, y: -30)
                .blur(radius: 16.0)
        )
    }
}

enum EyebrowType: Hashable {
    case neutral
    case anger
    case sadness
    case surprise
}

enum EyeType: Hashable {
    case normal(ExpressionType, IrisType, IrisPosition)
    case laughter
    case close
    case closeTightly

    enum ExpressionType {
        case neutral
        case anger
        case sadness
        case smile
        case surprise
        case dissatisfaction
        case sleepy

        var upperEyelashesOffsetY: CGFloat {
            switch self {
            case .neutral, .anger:
                0.0
            case .sadness, .smile:
                25.0
            case .dissatisfaction, .sleepy:
                50.0
            case .surprise:
                -25.0
            }
        }

        var lowerEyelashesOffsetY: CGFloat {
            switch self {
            case .neutral, .anger, .sadness, .smile, .dissatisfaction, .sleepy:
                0.0
            case .surprise:
                25.0
            }
        }

        var eyeAngle: Angle {
            switch self {
            case .neutral, .surprise, .dissatisfaction, .sleepy:
                .zero
            case .anger:
                Angle(degrees: -10.0)
            case .sadness, .smile:
                Angle(degrees: 5.0)
            }
        }

        var eyeHeight: CGFloat {
            switch self {
            case .neutral:
                0.0
            case .sadness, .smile:
                -50.0
            case .dissatisfaction, .sleepy:
                -25.0
            case .anger:
                25.0
            case .surprise:
                50.0
            }
        }
    }

    enum IrisType {
        case normal
        case heart
        case teary
        case dizzy
        case star
        case knockout
        case money
        case lifeless
    }

    enum IrisPosition {
        case center
        case top
        case bottom
        case left
        case right

        var irisOffset: CGPoint {
            switch self {
            case .center:
                .zero
            case .left:
                CGPoint(x: -35, y: .zero)
            case .right:
                CGPoint(x: 35, y: .zero)
            case .top:
                CGPoint(x: .zero, y: -35)
            case .bottom:
                CGPoint(x: .zero, y: 35)
            }
        }
    }
}
