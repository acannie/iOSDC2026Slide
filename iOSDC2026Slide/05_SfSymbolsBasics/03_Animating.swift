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
    @State private var expression: Expression = .neutral

    enum Expression: Int, CaseIterable {
        case neutral
        case lookLeft
        case lookRight
        case lookAbove
        case surprised
        case anger
        case sadness

        var upperEyelashesOffsetY: CGFloat {
            switch self {
            case .neutral, .anger, .lookLeft, .lookRight:
                0.0
            case .sadness:
                25.0
            case .surprised, .lookAbove:
                -25.0
            }
        }

        var lowerEyelashesOffsetY: CGFloat {
            switch self {
            case .neutral, .anger, .sadness, .lookLeft, .lookRight:
                0.0
            case .surprised, .lookAbove:
                25.0
            }
        }

        func eyeAngle(side: Side) -> Angle {
            switch self {
            case .neutral, .surprised, .lookAbove, .lookLeft, .lookRight:
                .zero
            case .anger:
                Angle(degrees: side.unit * -10.0)
            case .sadness:
                Angle(degrees: side.unit * 5.0)
            }
        }

        func whiteEyeAngle(side: Side) -> Angle {
            switch self {
            case .neutral, .surprised, .lookAbove, .lookLeft, .lookRight:
                .zero
            case .anger:
                Angle(degrees: side.unit * -20.0)
            case .sadness:
                Angle(degrees: side.unit * 5.0)
            }
        }

        var eyeHeight: CGFloat {
            switch self {
            case .neutral, .lookLeft, .lookRight:
                0.0
            case .sadness:
                -50.0
            case .anger:
                25.0
            case .surprised, .lookAbove:
                50.0
            }
        }

        func eyebrowAngle(_ angle: Angle, side: Side) -> Angle {
            switch self {
            case .neutral, .lookLeft, .lookRight, .surprised, .lookAbove:
                angle
            case .sadness:
                angle + Angle(degrees: side.unit * 15.0)
            case .anger:
                angle + Angle(degrees: side.unit * -10.0)
            }
        }

        func eyebrowOffsetY(_ offsetY: CGFloat) -> CGFloat {
            switch self {
            case .neutral, .anger, .sadness, .lookLeft, .lookRight:
                offsetY
            case .surprised, .lookAbove:
                offsetY - 50.0
            }
        }

        enum IrisPosition: Int, CaseIterable {
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
                    .init(x: -35, y: .zero)
                case .right:
                    .init(x: 35, y: .zero)
                case .top:
                    .init(x: .zero, y: -35)
                case .bottom:
                    .init(x: .zero, y: 35)
                }
            }
        }

        var irisPosition: IrisPosition {
            switch self {
            case .neutral, .sadness, .anger, .surprised:
                .center
            case .lookLeft:
                .left
            case .lookRight:
                .right
            case .lookAbove:
                .top
            }
        }
    }

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
                while true {
                    let randomInt = Int.random(in: 0..<Expression.allCases.count)
                    // 目の表情を決定
                    let rawValue = randomInt % Expression.allCases.count
                    let newExpression = Expression(rawValue: rawValue) ?? .neutral
                    if newExpression != expression {
                        expression = newExpression
                        break
                    }
                }
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

    var eye: some View {
        let originalIrisOffset = CGPoint(x: 325, y: -250)
        return VStack(spacing: 32) {
            ZStack {
                ForEach(Side.allCases) { side in
                    // 瞼
                    Image(systemName: "field.of.view.ultrawide.fill")
                        .resizable()
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.skin, .skinDark],
                                startPoint: side == .left ? .trailing : .leading,
                                endPoint: side == .left ? .leading : .trailing
                            )
                        )
                        .rotationEffect(.degrees(side.unit * 7) + expression.eyeAngle(side: side))
                        .frame(width: 400, height: 200)
                        .offset(x: side.unit * 390, y: -400 + expression.upperEyelashesOffsetY)
                    // 白目
                    Image(systemName: "button.angledbottom.horizontal.right.fill")
                        .resizable()
                        .foregroundStyle(.whiteOfEyes)
                        .rotationEffect(
                            Angle(degrees: side.unit * 20.0) + expression.whiteEyeAngle(side: side)
                        )
                        .frame(width: 350, height: 300.0 + expression.eyeHeight)
                        .offset(x: side.unit * 350, y: -250)
                    // 黒目
                    ZStack {
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
                        x: side.unit * (originalIrisOffset.x + side.unit * expression.irisPosition.irisOffset.x),
                        y: originalIrisOffset.y + expression.irisPosition.irisOffset.y
                    )
                    // アイライン
                    Image(systemName: "phone.down.fill")
                        .resizable()
                        .foregroundStyle(.eyelash)
                        .rotationEffect(
                            Angle(degrees: side.unit * 7.0) + expression.eyeAngle(side: side)
                        )
                        .frame(width: 475, height: 90)
                        .offset(x: side.unit * 400, y: -375 + expression.upperEyelashesOffsetY)
                    // 上まつ毛
                    Image(systemName: "line.3.horizontal.decrease")
                        .resizable()
                        .foregroundStyle(.eyelash)
                        .rotationEffect(
                            Angle(degrees: side.unit * 95) + expression.eyeAngle(side: side)
                        )
                        .frame(width: 75, height: 125)
                        .offset(x: side.unit * 450, y: -425 + expression.upperEyelashesOffsetY)
                    // 下まつ毛
                    Image(systemName: "line.3.horizontal.decrease")
                        .resizable()
                        .foregroundStyle(.eyelash)
                        .rotationEffect(.degrees(side.unit * 80))
                        .frame(width: 25, height: 125)
                        .offset(x: side.unit * 425, y: -125 + expression.lowerEyelashesOffsetY)
                    // 眉毛
                    Image(
                        systemName: side == .left
                        ? "button.angledtop.vertical.right.fill"
                        : "button.angledtop.vertical.left.fill"
                    )
                    .resizable()
                    .foregroundStyle(.eyebrow)
                    .rotationEffect(expression.eyebrowAngle(
                        Angle(degrees: side.unit * 95),
                        side: side
                    ))
                    .frame(width: 25, height: 350)
                    .offset(
                        x: side.unit * 350,
                        y: expression.eyebrowOffsetY(-550)
                    )
                }
                .offset(x: 0, y: 300)
            }
        }
        .animation(.easeInOut, value: count)
        .background(
            Ellipse()
                .fill(.skin)
                .frame(width: 2400, height: 700)
                .offset(x: 0, y: -30)
                .blur(radius: 16.0)
        )
    }
}
