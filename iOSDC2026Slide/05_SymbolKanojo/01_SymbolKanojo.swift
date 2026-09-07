//
//  SymbolKanojo.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct SymbolKanojo: View {
    @ObservedObject private var yuyuVM = YuyuViewModel()
    @State private var count: Int = 0
    var second: Int {
        Int(count / 2)
    }

    var body: some View {
        ZStack {
            backgroundLayer
            yuyuLayer
            tableLayer
            yuyuArmLayer
            creamSodaLayer
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .task {
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(0.5))
                if Task.isCancelled { break }
                count += 1
            }
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
                .rotationEffect(.degrees(side == .left ? 25 : -95), anchor: .bottom)
                .frame(width: 170, height: 550)
                .offset(x: side.unit * 220, y: 305)
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
                        wallClock
                            .padding(.leading, 32)
                            .offset(y: -64)
                        Spacer()
                        window
                    }
                    Spacer()
                }
                wallLamp
                    .offset(y: -450)
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
                HStack {
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
                    .foregroundStyle(.wallWaistWall)
                    .frame(maxWidth: .infinity)
                    .frame(height: 440)
            }
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

    var wallClock: some View {
        var clockFace: some View {
            ZStack {
                Image(systemName: "octagon.fill")
                    .resizable()
                    .foregroundStyle(.wallClockWoodDark)
                    .frame(width: 200, height: 200)
                Circle()
                    .fill(.wallClockWood)
                    .frame(width: 180, height: 180)
                Circle()
                    .fill(.wallClockFace)
                    .frame(width: 160, height: 160)
                Circle()
                    .fill(.clear)
                    .stroke(.wallClockNumber, lineWidth: 1)
                    .frame(width: 155, height: 155)
                Circle()
                    .fill(.clear)
                    .stroke(.wallClockNumber, lineWidth: 1)
                    .frame(width: 150, height: 150)
                // 文字
                Group {
                    ForEach(["I", "II", "III", "IV","V", "VI","VII", "VIII","IX", "X","XI", "XII"].enumerated(), id: \.offset) { index, time in
                        Text(time)
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .foregroundStyle(.wallClockNumber)
                            .scaleEffect(x: 0.6)
                            .padding(.bottom, 50)
                            .rotationEffect(.degrees(Double(index + 1) * 30), anchor: .bottom)
                    }
                }
                .offset(y: -40)
                // 長針
                Group {
                    VStack(spacing: -2) {
                        Image(systemName: "suit.spade.fill")
                            .resizable()
                            .foregroundStyle(.wallClockArrow)
                            .frame(width: 15, height: 30)
                        Rectangle()
                            .foregroundStyle(.wallClockArrow)
                            .frame(width: 5, height: 40)
                    }
                }
                .rotationEffect(.degrees(60), anchor: .bottom)
                .offset(y: -35)
                // 短針
                Group {
                    VStack(spacing: -2) {
                        Image(systemName: "suit.spade.fill")
                            .resizable()
                            .foregroundStyle(.wallClockArrow)
                            .frame(width: 15, height: 30)
                        Rectangle()
                            .foregroundStyle(.wallClockArrow)
                            .frame(width: 5, height: 20)
                    }
                }
                .rotationEffect(.degrees(-60), anchor: .bottom)
                .offset(y: -25)
                // 秒針
                Rectangle()
                    .foregroundStyle(.wallClockArrow)
                    .frame(width: 2, height: 70)
                    .rotationEffect(.degrees(CGFloat(second) * 6), anchor: .bottom)
                    .animation(.easeInOut, value: second)
                    .offset(y: -35)
                // 留め具
                Circle()
                    .fill(.wallClockPin)
                    .frame(width: 10, height: 10)
            }
        }
        var clockBody: some View {
            ZStack {
                // 背景
                Image(systemName: "shield.fill")
                    .resizable()
                    .foregroundStyle(.wallClockWoodDark)
                    .frame(width: 130, height: 260)
                // 振り子
                VStack(spacing: -2) {
                    Rectangle()
                        .foregroundStyle(.wallClockDiscDark)
                        .frame(width: 30)
                        .frame(maxHeight: .infinity)
                    Circle()
                        .fill(
                            AngularGradient(
                                colors: [.wallClockDisc, .wallClockDiscDark, .wallClockDisc, .wallClockDiscDark, .wallClockDisc],
                                center: .center,
                                startAngle: .degrees(45),
                                endAngle: .degrees(405)
                            )
                        )
                        .frame(width: 70, height: 70)
                }
                .frame(height: 160)
                .rotationEffect(
                    .degrees(count % 2 == 0 ? -10 : 10),
                    anchor: .top
                )
                .animation(.easeInOut(duration: 0.5), value: count)
                // 枠
                Image(systemName: "shield")
                    .resizable()
                    .foregroundStyle(.wallClockWoodDark)
                    .frame(width: 150, height: 300)
                Image(systemName: "shield")
                    .resizable()
                    .foregroundStyle(.wallClockWood)
                    .frame(width: 130, height: 260)
            }
        }
        return ZStack {
            clockBody
            clockFace
                .offset(y: -100)
                .offset(y: -5)
        }
    }

    var sofa: some View {
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

    var window: some View {
        var curtain: some View{
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .curtainDark, .curtainLight, .curtainDark, .curtainLight,.curtainDark, .curtainLight,.curtainDark, .curtainLight,.curtainDark
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 100, height: 600)
        }
        var rose: some View {
            var petal: some View {
                ZStack {
                    Image(systemName: "moon.fill")
                        .resizable()
                        .foregroundStyle(.windowRosePetal)
                        .padding(4)
                    Image(systemName: "moon")
                        .resizable()
                        .fontWeight(.bold)
                        .foregroundStyle(.windowEdge)
                }
                .frame(width: 80, height: 80)
            }
            var outerPetal: some View {
                ZStack {
                    Image(systemName: "hexagon.tophalf.filled")
                        .resizable()
                        .foregroundStyle(.windowRosePetal)
                        .padding(4)
                    Image(systemName: "hexagon")
                        .resizable()
                        .fontWeight(.black)
                        .foregroundStyle(.windowEdge)
                }
                .frame(width: 80, height: 80)
            }
            return ZStack {
                outerPetal
                    .offset(y: -20)
                outerPetal
                    .rotationEffect(.degrees(135))
                    .offset(x: 20, y: 20)
                outerPetal
                    .rotationEffect(.degrees(230))
                    .offset(x: -20, y: 20)
                Circle()
                    .fill(.windowRosePetal)
                    .frame(width: 80, height: 80)
                petal
                petal
                    .rotationEffect(.degrees(90))
                petal
                    .rotationEffect(.degrees(180))
                petal
                    .rotationEffect(.degrees(250))
            }
        }
        var stainedGlass: some View {
            var leaf: some View {
                ZStack {
                    Image(systemName: "leaf.fill")
                        .resizable()
                        .fontWeight(.black)
                        .foregroundStyle(.windowRoseLeaf)
                        .padding(4)
                    Image(systemName: "leaf")
                        .resizable()
                        .fontWeight(.heavy)
                        .foregroundStyle(.windowEdge)
                }
            }
            return ZStack {
                leaf
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(-70))
                    .offset(x: -30, y: 30)
                leaf
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(5))
                    .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                    .offset(x: 40, y: -40)
                rose
                    .offset(y: -30)
            }
        }
        func stainedGlassTriangle(isPlantColor: Bool) -> some View {
            ZStack {
                Image(systemName: "triangleshape.fill")
                    .resizable()
                    .foregroundStyle(.windowEdge)
                Group {
                    Image(systemName: "triangleshape.fill")
                        .resizable()
                        .foregroundStyle(isPlantColor ? .outsidePlant : .outsideSky)
                    Image(systemName: "triangleshape.fill")
                        .resizable()
                        .foregroundStyle(.regularMaterial)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            .frame(width: 120, height: 60)
            .padding(.bottom, 16)
        }
        return ZStack {
            VStack(spacing: 0) {
                // カーテンレール
                Rectangle()
                    .fill(.curtainRail)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                ZStack {
                    VStack(spacing: 16) {
                        ForEach(0..<2) { row in
                            HStack(spacing: 16) {
                                ForEach(0..<2) { column in
                                    ZStack(alignment: .bottom) {
                                        Rectangle()
                                            .fill(.outsideSky)
                                        if row == 1 {
                                            Capsule()
                                                .fill(.outsidePlant)
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 100)
                                            HStack {
                                                if column == 1 {
                                                    Spacer()
                                                }
                                                Capsule()
                                                    .fill(.outsidePlant)
                                                    .frame(width: 200, height: 200)
                                                if column == 0 {
                                                    Spacer()
                                                }
                                            }
                                        }
                                        Rectangle()
                                            .fill(.regularMaterial)
                                    }
                                }
                            }
                        }
                    }
                    .padding(20)
                    .background(.windowEdge)
                    stainedGlass
                    // ステンドグラス上下左右の装飾
                    Group {
                        HStack(spacing: 0) {
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.windowStainedGlassPink)
                                    .frame(width: 70, height: 40)
                                Rectangle()
                                    .fill(.windowStainedGlassYellow)
                                    .frame(width: 70)
                                    .frame(maxHeight: .infinity)
                                Rectangle()
                                    .fill(.windowStainedGlassPink)
                                    .frame(width: 70, height: 40)
                            }
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.windowStainedGlassPurple)
                                    .frame(height: 40)
                                    .frame(maxWidth: .infinity)
                                Spacer()
                                Rectangle()
                                    .fill(.windowStainedGlassPurple)
                                    .frame(height: 40)
                                    .frame(maxWidth: .infinity)
                            }
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.windowStainedGlassPink)
                                    .frame(width: 70, height: 40)
                                Rectangle()
                                    .fill(.windowStainedGlassYellow)
                                    .frame(width: 70)
                                    .frame(maxHeight: .infinity)
                                Rectangle()
                                    .fill(.windowStainedGlassPink)
                                    .frame(width: 70, height: 40)
                            }
                        }
                    }
                    .padding(20)
                    // ステンドグラス上下左右装飾の枠線
                    Group {
                        HStack(spacing: 0) {
                            Rectangle()
                                .fill(.windowEdge)
                                .frame(width: 6)
                                .frame(maxHeight: .infinity)
                                .padding(.leading, 70)
                            Spacer()
                            Rectangle()
                                .fill(.windowEdge)
                                .frame(width: 6)
                                .frame(maxHeight: .infinity)
                                .padding(.trailing, 70)
                        }
                        VStack(spacing: 0) {
                            Rectangle()
                                .fill(.windowEdge)
                                .frame(height: 6)
                                .frame(maxWidth: .infinity)
                                .padding(.top, 40)
                            Spacer()
                            Rectangle()
                                .fill(.windowEdge)
                                .frame(height: 6)
                                .frame(maxWidth: .infinity)
                                .padding(.bottom, 40)
                        }
                    }
                    .padding(20)
                    HStack {
                        stainedGlassTriangle(isPlantColor: false)
                            .rotationEffect(.degrees(90))
                        Spacer()
                        VStack {
                            stainedGlassTriangle(isPlantColor: false)
                                .rotationEffect(.degrees(180))
                            Spacer()
                            stainedGlassTriangle(isPlantColor: true)
                        }
                        Spacer()
                        stainedGlassTriangle(isPlantColor: false)
                            .rotationEffect(.degrees(270))
                    }
                }
            }
            .padding(.top, 8)
            .padding(.bottom, 32)
            .padding(.horizontal, 32)
            HStack {
                curtain
                Spacer()
                curtain
            }
        }
        .frame(width: 600, height: 600)
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
