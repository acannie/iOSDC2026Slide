//
//  MovingEyesView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/09/05.
//

import SwiftUI

struct MovingEyesView: View {
    let isShowingGraphic: Bool
    @State private var isAnimationStarted: Bool = false
    @State private var expression: Expression = .neutral
    @State private var count: Int = 0

    @State private var isShowingEyes: Bool = false

    @Namespace private var namespace

    private enum Expression: Int, CaseIterable {
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

    private let scale: CGFloat = 0.4
    private var originalIrisOffset: CGPoint {
        .init(x: 325 * scale, y: -250 * scale)
    }

    var body: some View {
        ZStack {
            if isShowingEyes {
                eyes
            }
            if !isShowingEyes {
                symbols
            }
        }
        .frame(width: 1600 * scale + 100, height: 1000 * scale + 100)
        .onTapGesture {
              withAnimation(.easeOut(duration: 2)) {
                  isShowingEyes.toggle()
              }
        }
        .onChange(of: isShowingGraphic) {
            Task {
                if isShowingGraphic {
                    isAnimationStarted = false
                } else {
                    isAnimationStarted = true
                }
            }
        }
        .task(id: isShowingGraphic) {
            if isShowingGraphic {
                while !Task.isCancelled {
                    try? await Task.sleep(for: .seconds(1))
                    if Task.isCancelled { break }
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
            } else {
                count = 0
            }
        }
    }
}

private extension MovingEyesView {
    enum SymbolName {
        case leftEyelid
        case rightEyelid
        case leftWhiteOfEye
        case rightWhiteOfEye
        case leftIrisBackground
        case rightIrisBackground
        case leftIris
        case rightIris
        case leftEyeline
        case rightEyeline
        case leftEyelashTop
        case rightEyelashTop
        case leftEyelashBottom
        case rightEyelashBottom
        case leftEyebrow
        case rightEyebrow
    }

    var symbols: some View {
        let symbolSize: CGFloat = 100
        return VStack {
            HStack {
                // 瞼
                Image(systemName: "field.of.view.ultrawide.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.leftEyelid, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "field.of.view.ultrawide.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.rightEyelid, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                // 白目
                Image(systemName: "button.angledbottom.horizontal.right.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.leftWhiteOfEye, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "button.angledbottom.horizontal.right.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.rightWhiteOfEye, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
            }
            HStack {
                // 黒目
                Image(systemName: "circle.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.leftIrisBackground, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "circle.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.rightIrisBackground, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.leftIris, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.rightIris, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
            }
            HStack {
                // アイライン
                Image(systemName: "phone.down.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.leftEyeline, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                Image(systemName: "phone.down.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.rightEyeline, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                // 眉毛
                Image(systemName: "button.angledtop.vertical.right.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.leftEyebrow, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .rotationEffect(.degrees(0))
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(-90))
                Image(systemName: "button.angledtop.vertical.left.fill")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.rightEyebrow, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .rotationEffect(.degrees(0))
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(90))
            }
            HStack {
                // 下まつ毛
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.leftEyelashBottom, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(-90))
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.rightEyelashBottom, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(90))
                // 上まつ毛
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.leftEyelashTop, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(-90))
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .matchedGeometryEffect(id: SymbolName.rightEyelashTop, in: namespace)
                    .foregroundStyle(.symbolEyes)
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(90))
            }
        }
    }

    var eyes: some View {
        ZStack {
            ForEach(Side.allCases) { side in
                // 瞼
                Image(systemName: "field.of.view.ultrawide.fill")
                    .resizable()
                    .matchedGeometryEffect(
                        id: side == .left ? SymbolName.leftEyelid : .rightEyelid,
                        in: namespace
                    )
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
                    .matchedGeometryEffect(
                        id: side == .left ? SymbolName.leftWhiteOfEye : .rightWhiteOfEye,
                        in: namespace
                    )
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
                        .matchedGeometryEffect(
                            id: side == .left ? SymbolName.leftIrisBackground : .rightIrisBackground,
                            in: namespace
                        )
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
                        .matchedGeometryEffect(
                            id: side == .left ? SymbolName.leftIris : .rightIris,
                            in: namespace
                        )
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
                    .matchedGeometryEffect(
                        id: side == .left ? SymbolName.leftEyeline : .rightEyeline,
                        in: namespace
                    )
                    .foregroundStyle(.eyelash)
                    .rotationEffect(
                        Angle(degrees: side.unit * 7.0) + expression.eyeAngle(side: side)
                    )
                    .frame(width: 475 * scale, height: 90 * scale)
                    .offset(x: side.unit * 400 * scale, y: -375  * scale + expression.upperEyelashesOffsetY * scale)
                // 上まつ毛
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .matchedGeometryEffect(
                        id: side == .left ? SymbolName.leftEyelashTop : .rightEyelashTop,
                        in: namespace
                    )
                    .foregroundStyle(.eyelash)
                    .rotationEffect(
                        Angle(degrees: side.unit * 95) + expression.eyeAngle(side: side)
                    )
                    .frame(width: 75 * scale, height: 125 * scale)
                    .offset(x: side.unit * 450 * scale, y: -425 * scale + expression.upperEyelashesOffsetY * scale)
                // 下まつ毛
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .matchedGeometryEffect(
                        id: side == .left ? SymbolName.leftEyelashBottom : .rightEyelashBottom,
                        in: namespace
                    )
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
                .matchedGeometryEffect(
                    id: side == .left ? SymbolName.leftEyebrow : .rightEyebrow,
                    in: namespace
                )
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
        }
        .offset(x: 0, y: 300 * scale)
        .animation(.easeInOut, value: count)
        .background(
            Ellipse()
                .fill(.skin)
                .frame(width: 1600 * scale, height: 1000 * scale)
                .offset(x: 0, y: -30 * scale)
                .blur(radius: 16.0)
        )
    }
}

private extension Side {
    var name: String {
        switch self {
        case .left: "left"
        case .right: "right"
        }
    }
}
