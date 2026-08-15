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
            HStack(spacing: 100) {
                creamSoda
                    .padding(.leading, 100)
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
            Image(systemName: "wineglass")
                .resizable()
                .frame(width: 300, height: 500)
        }
    }

    var eye: some View {
        let scale: CGFloat = 0.4
        let originalIrisOffset = CGPoint(x: 325 * scale, y: -250 * scale)
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
                        .frame(width: 400 * scale, height: 200 * scale)
                        .offset(x: side.unit * 390 * scale, y: -400 * scale + expression.upperEyelashesOffsetY * scale)
                    // 白目
                    Image(systemName: "button.angledbottom.horizontal.right.fill")
                        .resizable()
                        .foregroundStyle(.whiteOfEyes)
                        .rotationEffect(
                            Angle(degrees: side.unit * 20.0) + expression.whiteEyeAngle(side: side)
                        )
                        .frame(width: 350 * scale, height: 300.0 * scale + expression.eyeHeight * scale)
                        .offset(x: side.unit * 350 * scale, y: -250 * scale)
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
                            .frame(width: 250 * scale, height: 275 * scale)
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
                            .frame(width: 250 * scale, height: 275 * scale)
                    }
                    .offset(
                        x: side.unit * (originalIrisOffset.x + side.unit * expression.irisPosition.irisOffset.x * scale),
                        y: originalIrisOffset.y + expression.irisPosition.irisOffset.y * scale
                    )
                    // アイライン
                    Image(systemName: "phone.down.fill")
                        .resizable()
                        .foregroundStyle(.eyelash)
                        .rotationEffect(
                            Angle(degrees: side.unit * 7.0) + expression.eyeAngle(side: side)
                        )
                        .frame(width: 475 * scale, height: 90 * scale)
                        .offset(x: side.unit * 400 * scale, y: -375  * scale + expression.upperEyelashesOffsetY * scale)
                    // 上まつ毛
                    Image(systemName: "line.3.horizontal.decrease")
                        .resizable()
                        .foregroundStyle(.eyelash)
                        .rotationEffect(
                            Angle(degrees: side.unit * 95) + expression.eyeAngle(side: side)
                        )
                        .frame(width: 75 * scale, height: 125 * scale)
                        .offset(x: side.unit * 450 * scale, y: -425 * scale + expression.upperEyelashesOffsetY * scale)
                    // 下まつ毛
                    Image(systemName: "line.3.horizontal.decrease")
                        .resizable()
                        .foregroundStyle(.eyelash)
                        .rotationEffect(.degrees(side.unit * 80))
                        .frame(width: 25 * scale, height: 125 * scale)
                        .offset(x: side.unit * 425 * scale, y: -125 * scale + expression.lowerEyelashesOffsetY * scale)
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
                    .frame(width: 25 * scale, height: 350 * scale)
                    .offset(
                        x: side.unit * 350 * scale,
                        y: expression.eyebrowOffsetY(-550 * scale)
                    )
                }
                .offset(x: 0, y: 300 * scale)
            }
        }
        .animation(.easeInOut, value: count)
        .background(
            Ellipse()
                .fill(.skin)
                .frame(width: 1600 * scale, height: 1000 * scale)
                .offset(x: 0, y: -30 * scale)
                .blur(radius: 16.0)
        )
        .frame(width: 1600 * scale + 100, height: 1000 * scale + 100)
    }
}
