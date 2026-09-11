//
//  02_SymbolKanojo.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct SymbolKanojo: View {
    let isActive: Bool
    @ObservedObject private var yuyuVM = YuyuViewModel()
    @State private var count: Int = 0
    @State private var isShowingBooks = false
    @State private var isShowingClock = false
    @State private var isShowingLight = false
    @State private var isShowingPlant = false
    @State private var isShowingYuyu = false
    @State private var isShowingCreamSoda = false
    @State private var isCurtainsOpened = false

    private var expressionAndGestureIndex: Int {
        count % expressionAndGestures.count
    }
    private var expressionAndGesture: ExpressionAndGesture {
        expressionAndGestures[expressionAndGestureIndex]
    }
    private struct ExpressionAndGesture {
        let expression: Expression
        let isLeftHandUp: Bool
        let isRightHandUp: Bool

        init(expression: Expression, isLeftHandUp: Bool = false, isRightHandUp: Bool = false) {
            self.expression = expression
            self.isLeftHandUp = isLeftHandUp
            self.isRightHandUp = isRightHandUp
        }
    }
    private let expressionAndGestures: [ExpressionAndGesture] = [
        // ニュートラル
        .init(
            expression: .init(faceType: .neutral, eyebrowsType: .neutral, eyesType: .normal(.neutral, .normal, .center), mouthType: .smile(.medium, .none))
        ),
        // 驚き
        .init(
            expression: .init(faceType: .neutral, eyebrowsType: .surprise, eyesType: .normal(.surprise, .normal, .center), mouthType: .surprise(.medium)),
            isLeftHandUp: true,
            isRightHandUp: true
        ),
        // てへぺろ
        .init(
            expression: .init(faceType: .hot, eyebrowsType: .neutral, eyesType: .normal(.neutral, .normal, .right), mouthType: .smile(.medium, .licking), emotionalEmissionType: .sweat)
        ),
        // がーん
        .init(
            expression: .init(faceType: .cold, eyebrowsType: .sadness, eyesType: .normal(.sadness, .normal, .center), mouthType: .wailing(.medium, .none))
        ),
        // ねむい
        .init(
            expression: .init(faceType: .neutral, eyebrowsType: .neutral, eyesType: .normal(.sleepy, .normal, .center), mouthType: .surprise(.large)),
            isLeftHandUp: true
        ),
        // 微笑み
        .init(
            expression: .init(faceType: .hot, eyebrowsType: .neutral, eyesType: .normal(.smile, .normal, .left), mouthType: .smile(.medium, .none))
        ),
        // 怒る
        .init(
            expression: .init(faceType: .neutral, eyebrowsType: .anger, eyesType: .normal(.anger, .normal, .center), mouthType: .surprise(.medium))
        ),
        // 悲しい
        .init(
            expression: .init(faceType: .neutral, eyebrowsType: .sadness, eyesType: .normal(.sadness, .teary, .center), mouthType: .defeated, emotionalEmissionType: .tear(.moist))
        ),
        // ウインク
        .init(
            expression: .init(faceType: .neutral, eyebrowsType: .anger, leftEyeType: .normal(.neutral, .normal, .center), rightEyeType: .closeTightly, mouthType: .grittedTeeth)
        ),
    ]

    var body: some View {
        ZStack {
            backgroundLayer
            yuyuLayer
                .opacity(isShowingYuyu ? 1 : 0)
                .animation(.easeInOut, value: isShowingYuyu)
            tableLayer
            yuyuArmLayer
                .opacity(isShowingYuyu ? 1 : 0)
                .animation(.easeInOut, value: isShowingYuyu)
            creamSodaLayer
                .opacity(isShowingCreamSoda ? 1 : 0)
                .animation(.easeInOut, value: isShowingCreamSoda)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            Color.black.opacity(isCurtainsOpened ? 0 : 0.2)
                .ignoresSafeArea()
        }
        .animation(.easeInOut, value: isCurtainsOpened)
        .animation(.easeInOut, value: isShowingYuyu)
        .animation(.easeInOut, value: isShowingCreamSoda)
        .onChange(of: isActive) {
            if isActive {
                Task {
                    try? await Task.sleep(for: .seconds(0.6))
                    isShowingBooks = true
                    try? await Task.sleep(for: .seconds(0.3))
                    isShowingLight = true
                    try? await Task.sleep(for: .seconds(0.3))
                    isShowingPlant = true
                    try? await Task.sleep(for: .seconds(0.3))
                    isShowingClock = true
                    try? await Task.sleep(for: .seconds(0.3))
                    isShowingCreamSoda = true
                    try? await Task.sleep(for: .seconds(0.3))
                    isShowingYuyu = true
                    try? await Task.sleep(for: .seconds(1.0))
                    isCurtainsOpened = true
                    try? await Task.sleep(for: .seconds(1.0))
                    while true {
                        count += 1
                        try? await Task.sleep(for: .seconds(2))
                    }
                }
            }
        }
        .onChange(of: expressionAndGestureIndex) {
            yuyuVM.express(expressionAndGesture.expression)
        }
    }
}

private extension SymbolKanojo {
    var yuyuLayer: some View {
        KanojoView(
            kanojoParts: yuyuVM.parts,
            scale: 1.0,
            isUpsideDown: yuyuVM.activeAction == .turnUpsideDown
        )
        .offset(x: -200, y: -100)
        .opacity(yuyuVM.activeAction == .fade ? 0.5 : 1.0)
        .offset(x: yuyuVM.activeAction == .shake ? 2 : 0)
    }

    var tableLayer: some View {
        ZStack {
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 12)
                    .fill(.table)
                    .frame(height: 120)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 260)
                    .offset(x: -12, y: 12)
            }
        }
    }

    var creamSodaLayer: some View {
        VStack {
            Spacer()
            HStack {
                CreamSodaView(
                    isShowingGraphic: true,
                    isShowingCreamSoda: true,
                    isMovingSpoon: false
                )
                .scaleEffect(0.65)
                .padding(.leading, 670)
                .offset(y: 120)
                Spacer()
            }
        }
    }

    var yuyuArmLayer: some View {
        var nail: some View {
            Image(systemName: "capsule.portrait.fill")
                .resizable()
                .foregroundStyle(.yuyuNail)
        }
        return ZStack {
            ForEach(Side.allCases, id: \.self) { side in
                var isHandUp: Bool {
                    let isLeftHandUp = (side == .left) && expressionAndGesture.isLeftHandUp
                    let isRightHandUp = (side == .right) && expressionAndGesture.isRightHandUp
                    return isLeftHandUp || isRightHandUp
                }
                ZStack {
                    // 手
                    Group {
                        // 手の甲
                        Image(systemName: "hand.raised.fingers.spread.fill")
                            .resizable()
                            .foregroundStyle(.yuyuSkinMiddle)
                            .frame(width: 140, height: 190)
                        // 爪
                        nail
                            .rotationEffect(.degrees(16))
                            .frame(width: 15, height: 21)
                            .offset(x: 62, y: -4)
                        nail
                            .rotationEffect(.degrees(5))
                            .frame(width: 16, height: 24)
                            .offset(x: 33, y: -70)
                        nail
                            .rotationEffect(.degrees(-1))
                            .frame(width: 16, height: 24)
                            .offset(x: -1, y: -83)
                        nail
                            .rotationEffect(.degrees(-10))
                            .frame(width: 16, height: 24)
                            .offset(x: -34, y: -70)
                        nail
                            .rotationEffect(.degrees(-10))
                            .frame(width: 14, height: 24)
                            .offset(x: -62, y: -52)
                    }
                    .rotation3DEffect(
                        .degrees(side == .left ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .offset(y: -200)
                    // 袖
                    Capsule()
                        .fill(.sailorPinkLight)
                        .frame(width: 150, height: 300)
                        .offset(y: 80)
                    Group {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.sailorPurpleLight)
                            .frame(width: 120, height: 80)
                        Capsule()
                            .fill(.sailorWhite)
                            .frame(width: 125, height: 10)
                            .offset(y: -10)
                        Capsule()
                            .fill(.sailorWhite)
                            .frame(width: 125, height: 10)
                            .offset(y: 10)
                    }
                    .offset(y: -90)
                }
                .rotationEffect(
                    .degrees(isHandUp ? (side.unit * -25) : (side.unit * -95)),
                    anchor: .bottom
                )
                .frame(width: 170, height: 550)
                .offset(x: side.unit * 220, y: 305)
                .animation(.easeInOut(duration: 0.6), value: isHandUp)
            }
        }
        .offset(x: -200, y: -100)
    }

    var backgroundLayer: some View {
        ZStack {
            ZStack {
                wall
                VStack {
                    HStack {
                        WallClockView()
                            .opacity(isShowingClock ? 1 : 0)
                            .animation(.easeInOut, value: isShowingClock)
                            .padding(.leading, 32)
                            .offset(y: -64)
                        Spacer()
                        WindowView(isCurtainsClosed: !isCurtainsOpened)
                            .offset(x: 50)
                    }
                    Spacer()
                }
                wallLamp
                    .opacity(isShowingLight ? 1 : 0)
                    .animation(.easeInOut, value: isShowingLight)
                    .offset(y: -450)
//                BlackboardView()
//                    .offset(x: -650, y: -20)
            }
            VStack {
                Spacer()
                sofa
                    .padding(.trailing, 300)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    plant
                        .opacity(isShowingPlant ? 1 : 0)
                        .animation(.easeInOut, value: isShowingPlant)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

private extension SymbolKanojo {
    var wall: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.wall)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack(spacing: 0) {
                HStack(alignment: .bottom, spacing: 8) {
                    Spacer()
                    // 柱
                    Rectangle()
                        .foregroundStyle(.wallPillar)
                        .frame(width: 100)
                        .frame(maxHeight: .infinity)
                    Spacer()
                }
                // 腰壁
                Rectangle()
                    .foregroundStyle(.wallPillar)
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                Rectangle()
                    .foregroundStyle(.wallWaistWall)
                    .frame(maxWidth: .infinity)
                    .frame(height: 420)
            }
            HStack(alignment: .bottom) {
                VStack {
                    Spacer()
                    BooksView()
                        .opacity(isShowingBooks ? 1 : 0)
                        .animation(.easeInOut, value: isShowingBooks)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 450)
        }
    }

    var wallLamp: some View {
        ZStack {
            Circle()
                .fill(.wallLampBulbMain)
                .frame(width: 40, height: 40)
                .shadow(color: .wallLampBulbShadow, radius: 10)
                .offset(y: 40)
            Image(systemName: "triangleshape.fill")
                .resizable()
                .foregroundStyle(
                    AngularGradient(
                        colors: [.wallLampCoverDark, .wallLampCover, .wallLampCoverDark],
                        center: .top,
                        startAngle: .degrees(0),
                        endAngle: .degrees(180))
                )
                .frame(width: 200, height: 80)
        }
    }

    var sofa: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(0..<10) { _ in
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(
                            LinearGradient(
                                stops: [
                                    .init(color: .sofaRedDark, location: 0.0),
                                    .init(color: .sofaRed, location: 0.2),
                                    .init(color: .sofaRed, location: 0.8),
                                    .init(color: .sofaRedDark, location: 1.0),
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                }
            }
            HStack(spacing: 0) {
                Spacer()
                ForEach(0..<9) { index in
                    ZStack {
                        Circle()
                            .fill(.sofaRedDark)
                            .frame(width: 50, height: 50)
                            .blur(radius: 4)
                        Circle()
                            .fill(.sofaRed)
                            .frame(width: 30, height: 30)
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 25)
        }
    }

    var plant: some View {
        var leaf: some View {
            ZStack {
                Image(systemName: "leaf.fill")
                    .resizable()
                    .fontWeight(.black)
                    .foregroundStyle(.plantLeafLight)
                    .padding(4)
                Image(systemName: "leaf")
                    .resizable()
                    .foregroundStyle(.plantLeafDark)
            }
        }
        var trunk: some View {
            Text("ノ")
                .font(.system(size: 200))
                .foregroundStyle(.plantTrunk)
        }
        return ZStack {
            leaf
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-5))
                .offset(x: 20, y: -290)
            trunk
                .scaleEffect(y: 2.0)
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .rotationEffect(.degrees(35))
                .offset(x: 40, y: -130)
            leaf
                .frame(width: 120, height: 120)
                .rotationEffect(.degrees(-5))
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .offset(x: 50, y: -180)
            trunk
                .scaleEffect(y: 1.0)
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .rotationEffect(.degrees(45))
                .offset(x: 70, y: -30)
            trunk
                .scaleEffect(y: 2.0)
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .rotationEffect(.degrees(35))
                .offset(x: 80, y: 130)
            trunk
                .scaleEffect(y: 4.0)
                .rotationEffect(.degrees(-20))
                .offset(x: 20, y: 80)
            trunk
                .scaleEffect(y: 3.0)
                .rotationEffect(.degrees(-30))
                .offset(x: -30, y: 100)
            leaf
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-5))
                .offset(x: -60, y: -200)
            leaf
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(-5))
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .offset(x: 110, y: -300)
            leaf
                .frame(width: 120, height: 120)
                .rotationEffect(.degrees(-45))
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .offset(x: 150, y: -110)
            leaf
                .frame(width: 160, height: 160)
                .rotationEffect(.degrees(-80))
                .offset(x: -50, y: 80)
            leaf
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(-60))
                .offset(x: -100, y: -50)
            leaf
                .frame(width: 170, height: 170)
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .rotationEffect(.degrees(90))
                .offset(x: 140, y: 30)
            leaf
                .frame(width: 220, height: 220)
                .rotationEffect(.degrees(-100))
                .offset(x: 10, y: 0)
            leaf
                .frame(width: 110, height: 110)
                .rotationEffect(.degrees(-50), anchor: .bottomTrailing)
                .offset(x: -55, y: -200)
        }
        .frame(width: 340, height: 560)
    }

    var rightWall: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.blue)
                .frame(width: 300, height: 700)
                .rotation3DEffect(
                    .degrees(-45),
                    axis: (0, 1, 0)
                )
        }
    }
}
