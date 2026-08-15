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

    var eye: some View {
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
        enum Expression: Int, CaseIterable {
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

            func eyebrowAngle(_ angle: Angle) -> Angle {
                switch self {
                case .neutral, .surprise, .smile:
                    angle
                case .anger:
                    angle + Angle(degrees: 15.0)
                case .sadness, .sleepy, .dissatisfaction:
                    angle + Angle(degrees: -10.0)
                }
            }

            func eyebrowOffsetY(_ offsetY: CGFloat) -> CGFloat {
                switch self {
                case .neutral, .anger, .sadness, .smile, .dissatisfaction, .sleepy:
                    offsetY
                case .surprise:
                    offsetY - 50.0
                }
            }

            var irisPosition: IrisPosition {
                switch self {
                case .neutral:
                    .center
                case .sadness, .smile:
                    .center
                case .dissatisfaction, .sleepy:
                    .center
                case .anger:
                    .center
                case .surprise:
                    .center
                }
            }
        }

        var expression: Expression {
            let rawValue = (count / 3) % Expression.allCases.count
            return Expression(rawValue: rawValue) ?? .neutral
        }
        let originalIrisOffset = CGPoint(x: 325, y: -250)
        return VStack(spacing: 32) {
            ZStack {
                // 白目
                Image(systemName: "button.angledbottom.horizontal.right.fill")
                    .resizable()
                    .foregroundStyle(.whiteOfEyes)
                    .rotationEffect(
                        Angle(degrees: 20.0) + expression.eyeAngle
                    )
                    .frame(width: 350, height: 300.0 + expression.eyeHeight)
                    .offset(x: 350, y: -250)
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
                    x: originalIrisOffset.x + expression.irisPosition.irisOffset.x,
                    y: originalIrisOffset.y + expression.irisPosition.irisOffset.y
                )
                // アイライン
                Image(systemName: "phone.down.fill")
                    .resizable()
                    .foregroundStyle(.eyelash)
                    .rotationEffect(
                        Angle(degrees: 7.0) + expression.eyeAngle
                    )
                    .frame(width: 475, height: 90)
                    .offset(x: 400, y: -375 + expression.upperEyelashesOffsetY)
                // 二重線
                Image(systemName: "button.angledtop.vertical.right.fill")
                    .resizable()
                    .foregroundStyle(.skinDark)
                    .rotationEffect(
                        Angle(degrees: 275) + expression.eyeAngle
                    )
                    .frame(width: 15, height: 350)
                    .offset(x: 400, y: -425 + expression.upperEyelashesOffsetY)
                // 上まつ毛
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .foregroundStyle(.eyelash)
                    .rotationEffect(
                        Angle(degrees: 95) + expression.eyeAngle
                    )
                    .frame(width: 75, height: 125)
                    .offset(x: 450, y: -425 + expression.upperEyelashesOffsetY)
                // 下まつ毛
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .foregroundStyle(.eyelash)
                    .rotationEffect(.degrees(80))
                    .frame(width: 25, height: 125)
                    .offset(x: 425, y: -125 + expression.lowerEyelashesOffsetY)
                // 眉毛
                Image(systemName: "button.angledtop.vertical.left.fill")
                    .resizable()
                    .foregroundStyle(.eyebrow)
                    .rotationEffect(expression.eyebrowAngle(
                        Angle(degrees: 95)
                    ))
                    .frame(width: 25, height: 350)
                    .offset(
                        x: 350,
                        y: expression.eyebrowOffsetY(-550)
                    )
            }
            .offset(x: -350, y: 300)
        }
        .animation(.easeInOut, value: count)
        .background(
            Ellipse()
                .fill(.skin)
                .frame(width: 600, height: 700)
                .offset(x: 20, y: -30)
                .blur(radius: 16.0)
        )
    }
}
