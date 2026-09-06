//
//  SymbolKanojo.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct SymbolKanojo: View {
    @ObservedObject private var yuyuVM = YuyuViewModel()

    var body: some View {
        ZStack {
            backgroundLayer
            yuyuLayer
            tableLayer
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension SymbolKanojo {
    var yuyuLayer: some View {
        KanojoView(
            kanojoParts: yuyuVM.parts,
            scale: 1.0,
            isUpsideDown: yuyuVM.activeAction == .turnUpsideDown
        )
        .offset(x: -150, y: -100)
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
            VStack {
                Spacer()
                HStack {
                    CreamSodaView(isShowingGraphic: true, isShowingCreamSoda: true)
                        .scaleEffect(0.65)
                        .padding(.leading, 60)
                        .offset(y: 120)
                    Spacer()
                }
            }
        }
    }

    var backgroundLayer: some View {
        ZStack {
            ZStack {
                wall
                VStack {
                    HStack {
                        Spacer()
                        window
                            .padding(.top, 32)
                    }
                    Spacer()
                }
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
            VStack {
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
            trunk
                .scaleEffect(y: 4.0)
                .rotationEffect(.degrees(-20))
                .offset(x: 20, y: 80)
            trunk
                .scaleEffect(y: 3.0)
                .rotationEffect(.degrees(-30))
                .offset(x: -30, y: 100)
            trunk
                .scaleEffect(y: 2.0)
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .rotationEffect(.degrees(35))
                .offset(x: 40, y: -130)
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
            leaf
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-5))
                .offset(x: -60, y: -200)
            leaf
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-5))
                .offset(x: 20, y: -290)
            leaf
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(-5))
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .offset(x: 110, y: -300)
            leaf
                .frame(width: 120, height: 120)
                .rotationEffect(.degrees(-5))
                .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                .offset(x: 50, y: -180)
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
                .frame(width: 100, height: 560)
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
        return ZStack {
            VStack(spacing: 4) {
                Capsule()
                    .fill(.curtainRail)
                    .frame(maxWidth: .infinity)
                    .frame(height: 16)
                ZStack {
                    VStack(spacing: 16) {
                        ForEach(0..<2) { _ in
                            HStack(spacing: 16) {
                                ForEach(0..<2) { _ in
                                    Rectangle()
                                        .fill(.windowGlass)
                                        .shadow(color: .white, radius: 4)
                                }
                            }
                        }
                    }
                    .padding(24)
                    .background(.windowEdge)
                    stainedGlass
                    HStack {
                        ZStack {
                            Image(systemName: "triangleshape.fill")
                                .resizable()
                                .foregroundStyle(.windowEdge)
                            Image(systemName: "triangleshape.fill")
                                .resizable()
                                .foregroundStyle(.windowGlass)
                                .padding(.horizontal, 20)
                                .padding(.top, 20)
                        }
                        .frame(width: 120, height: 60)
                        .padding(.bottom, 24)
                        .rotationEffect(.degrees(90))
                        Spacer()
                        VStack {
                            ZStack {
                                Image(systemName: "triangleshape.fill")
                                    .resizable()
                                    .foregroundStyle(.windowEdge)
                                Image(systemName: "triangleshape.fill")
                                    .resizable()
                                    .foregroundStyle(.windowGlass)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 4)
                            }
                            .frame(width: 100, height: 50)
                            .padding(.bottom, 20)
                            .rotationEffect(.degrees(180))
                            Spacer()
                            ZStack {
                                Image(systemName: "triangleshape.fill")
                                    .resizable()
                                    .foregroundStyle(.windowEdge)
                                Image(systemName: "triangleshape.fill")
                                    .resizable()
                                    .foregroundStyle(.windowGlass)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 4)
                            }
                            .frame(width: 100, height: 50)
                            .padding(.bottom, 20)
                        }
                        Spacer()
                        ZStack {
                            Image(systemName: "triangleshape.fill")
                                .resizable()
                                .foregroundStyle(.windowEdge)
                            Image(systemName: "triangleshape.fill")
                                .resizable()
                                .foregroundStyle(.windowGlass)
                                .padding(.horizontal, 20)
                                .padding(.top, 20)
                        }
                        .frame(width: 120, height: 60)
                        .padding(.bottom, 24)
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
        .frame(width: 600, height: 520)
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
