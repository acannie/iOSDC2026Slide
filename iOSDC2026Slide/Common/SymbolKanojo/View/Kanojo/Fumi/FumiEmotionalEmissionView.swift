//
//  FumiEmotionalEmissionView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/03.
//

import SwiftUI
import Combine

struct FumiEmotionalEmissionView: EmotionalEmissionView {
    @ObservedObject private var vm: FumiEmotionalEmissionViewModel

    @State private(set) var isLeftTearAnimated: Bool = false
    @State private(set) var isRightTearAnimated: Bool = false
    @State private(set) var isSweatAnimated: Bool = false
    @State private(set) var isVomitAnimated: Bool = false
    @State private(set) var isSnotBubbleAnimated: Bool = false
    @State private(set) var isSnotAnimated: Bool = false
    @State private(set) var isDroolAnimated: Bool = false
    @State private(set) var isConfettiAnimated: Bool = false

    private let heartCount = 3
    private let confettiCount = 30
    private let confettiColorSet: Set<Color> = [.red, .orange, .yellow, .blue, .indigo, .pink]
    private let initialConfettiOffsetList: [CGPoint]

    private let tearColor = Color("tear")
    private let sweatColor = Color("sweat")
    private let snoreColor = Color("snore")
    private let vomitSparkleColor = Color("vomitSparkle")
    private let snotColor = Color("snot")
    private let droolColor = Color("drool")
    private let smokeColor = Color("smoke")
    private let haloColor = Color("halo")
    private let hornColor = Color("horn")
    private let heartColor = Color("heart")
    private let grawlixTextColor = Color("grawlixText")
    private let grawlixBackgroundColor = Color("grawlixBackground")

    init(vm: FumiEmotionalEmissionViewModel) {
        self.vm = vm
        self.initialConfettiOffsetList = (0..<confettiCount).map { _ in
            .init(
                x: CGFloat.random(in: -300...300),
                y: CGFloat.random(in: -400...400)
            )
        }
    }

    var body: some View {
        ZStack {
            switch vm.emotionalEmissionType {
            case .tear(let tearType):
                switch tearType {
                case .moist: moistTear
                case .weep: weepTear
                case .sob: sobTear
                }
            case .sweat: sweat
            case .snore: snore
            case .vomit: vomit
            case .snot(let snotType):
                switch snotType {
                case .bubble: snotBubble
                case .drop: snotDrop
                }
            case .drool: drool
            case .smoke: smoke
            case .halo: halo
            case .horns: horns
            case .heart: heart
            case .confetti: confetti
            case .grawlix: grawlix
            case .explode: explode
            case .nothing: EmptyView()
            }
        }
    }
}

private extension FumiEmotionalEmissionView {
    var moistTear: some View {
        ZStack {
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "cloud.fill")
                    .resizable()
                    .foregroundStyle(tearColor)
                    .frame(width: 40, height: 25)
                    .offset(x: side.unit * 85, y: -25)
                    .ios18Animation(.wiggle)
            }
        }
    }

    var weepTear: some View {
        var leftTearOffsetY: CGFloat {
            isLeftTearAnimated ? 200.0 : 0.0
        }
        var rightTearOffsetY: CGFloat {
            isRightTearAnimated ? 200.0 : 0.0
        }
        var leftTearOpacity: CGFloat {
            isLeftTearAnimated ? 0.0 : 1.0
        }
        var rightTearOpacity: CGFloat {
            isRightTearAnimated ? 0.0 : 1.0
        }
        return ZStack {
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(tearColor)
                .opacity(leftTearOpacity)
                .frame(width: 20, height: 40)
                .offset(x: Side.left.unit * 85, y: leftTearOffsetY)
                .animation(.easeIn(duration: 2.0).repeatForever(autoreverses: false), value: isLeftTearAnimated)
            Image(systemName: "drop.fill")
                .resizable()
                .foregroundStyle(tearColor)
                .opacity(rightTearOpacity)
                .frame(width: 20, height: 40)
                .offset(x: Side.right.unit * 85, y: rightTearOffsetY)
                .animation(.easeIn(duration: 2.0).delay(1.0).repeatForever(autoreverses: false), value: isRightTearAnimated)
        }
        .onAppear {
            isLeftTearAnimated = true
            isRightTearAnimated = true
        }
        .onDisappear {
            isLeftTearAnimated = false
            isRightTearAnimated = false
        }
    }

    var sobTear: some View {
        ZStack {
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "square.fill")
                    .resizable()
                    .foregroundStyle(tearColor)
                    .frame(width: 20, height: 70)
                    .offset(x: side.unit * 85, y: 5)
            }
        }
    }

    var sweat: some View {
        var sweatOffsetY: CGFloat {
            isSweatAnimated ?  -100 : -200
        }
        var sweatOpacity: CGFloat {
            isSweatAnimated ? 0.0 : 1.0
        }
        return Image(systemName: "drop.fill")
            .resizable()
            .foregroundStyle(sweatColor)
            .opacity(sweatOpacity)
            .frame(width: 40, height: 80)
            .offset(x: Side.left.unit * 85, y: sweatOffsetY)
            .animation(.easeIn(duration: 2.0).repeatForever(autoreverses: false), value: isSweatAnimated)
            .onAppear {
                isSweatAnimated = true
            }
            .onDisappear {
                isSweatAnimated = false
            }
    }

    var snore: some View {
        Image(systemName: "zzz")
            .resizable()
            .fontWeight(.bold)
            .rotationEffect(.degrees(15))
            .foregroundStyle(snoreColor)
            .aspectRatio(contentMode: .fit)
            .shadow(color: .white, radius: 30)
            .frame(width: 80)
            .offset(x: 120, y: 70)
            .ios18Animation(.breath)
    }

    var vomit: some View {
        var vomitHeight: CGFloat {
            isVomitAnimated ? 150 : 120
        }
        var vomitOffsetY: CGFloat {
            vomitHeight / 2
        }
        return ZStack {
            // 虹
            ZStack {
                ForEach(Side.allCases, id: \.self) { side in
                    Image(systemName: "lightspectrum.horizontal")
                        .resizable()
                        .symbolRenderingMode(.multicolor)
                        .offset(x: -side.unit * 2)
                }
            }
            .frame(width: 80, height: vomitHeight)
            .offset(y: 35 + vomitOffsetY)
            .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isVomitAnimated)
            .onAppear {
                isVomitAnimated = true
            }
            .onDisappear {
                isVomitAnimated = false
            }
            // キラキラ
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "sparkles")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(vomitSparkleColor)
                    .shadow(color: vomitSparkleColor, radius: 40)
                    .frame(width: 40)
                    .offset(
                        x: side.unit * 50,
                        y: 110 + side.unit * 20
                    )
                    .ios18Animation(.breath)
            }
        }
    }

    var snotBubble: some View {
        var snotBubbleSize: CGSize {
            .init(
                width: isSnotBubbleAnimated ? 60 : 24,
                height: isSnotBubbleAnimated ? 80 : 32
            )
        }
        var snotBubbleOffsetX: CGFloat {
            snotBubbleSize.height / 2
        }
        return Image(systemName: "drop.fill")
            .resizable()
            .rotationEffect(.degrees(270))
            .foregroundStyle(snotColor)
            .frame(width: snotBubbleSize.width, height: snotBubbleSize.height)
            .offset(x: 5 + snotBubbleOffsetX, y: 5)
            .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true), value: isSnotBubbleAnimated)
            .onAppear {
                isSnotBubbleAnimated = true
            }
            .onDisappear {
                isSnotBubbleAnimated = false
            }
    }

    var snotDrop: some View {
        var snotDropOffsetY: CGFloat {
            isSnotAnimated ? 100 : 0
        }
        var snotDropOpacity: CGFloat {
            isSnotAnimated ? 0.0 : 1.0
        }
        return Image(systemName: "drop.fill")
            .resizable()
            .foregroundStyle(snotColor)
            .opacity(snotDropOpacity)
            .frame(width: 15, height: 30)
            .offset(x: 5, y: 15 + snotDropOffsetY)
            .animation(.easeIn(duration: 2.0).repeatForever(autoreverses: false), value: isSnotAnimated)
            .onAppear {
                isSnotAnimated = true
            }
            .onDisappear {
                isSnotAnimated = false
            }
    }

    var drool: some View {
        var droolHeight: CGFloat {
            isDroolAnimated ? 20 : 60
        }
        var droolOffsetY: CGFloat {
            droolHeight / 2
        }
        return Image(systemName: "drop.fill")
            .resizable()
            .foregroundStyle(droolColor)
            .frame(width: 20, height: droolHeight)
            .offset(x: 20, y: 25 + droolOffsetY)
            .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isDroolAnimated)
            .onAppear {
                isDroolAnimated = true
            }
            .onDisappear {
                isDroolAnimated = false
            }
    }

    var smoke: some View {
        ZStack {
            ForEach(0..<30, id: \.self) { _ in
                Image(systemName: "cloud.fill")
                    .resizable()
                    .foregroundStyle(smokeColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat.random(in: 100...200))
                    .offset(
                        x: CGFloat.random(in: -200...200),
                        y: CGFloat.random(in: -300...300)
                    )
                    .ios18Animation(.breath)
            }
        }
    }

    var halo: some View {
        Image(systemName: "circle")
            .resizable()
            .foregroundStyle(haloColor)
            .frame(width: 300, height: 50)
            .offset(x: 0, y: -270)
            .ios18Animation(.pulse)
    }

    var horns: some View {
        ZStack {
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "cone.fill")
                    .resizable()
                    .foregroundStyle(hornColor)
                    .rotationEffect(.degrees(side.unit * 15))
                    .frame(width: 50, height: 150)
                    .offset(x: side.unit * 80, y: -250)
            }
        }
    }

    var heart: some View {
        ZStack {
            ForEach(Array(0..<heartCount), id: \.self) { heartIndex in
                let heartIndexCGFloat = CGFloat(heartIndex)
                let directionMultiplier = Double(pow(-1, heartIndexCGFloat))
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundStyle(heartColor)
                    .rotationEffect(Angle(degrees: directionMultiplier * 15))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .offset(
                        x: directionMultiplier * 150,
                        y: 100 * heartIndexCGFloat
                    )
                    .ios18Animation(.bounce)
            }
        }
    }

    var confetti: some View {
        var confettiOffsetY: CGFloat {
            isConfettiAnimated ? 400 : -100
        }
        var confettiOpacity: CGFloat {
            confettiOffsetY < 300 ? 1.0 : 0.0
        }
        return ZStack {
            ForEach(0..<confettiCount, id: \.self) { confettiIndex in
                let confettiColor = confettiColorSet.randomElement() ?? .red
                let initialConfettiOffset = initialConfettiOffsetList[confettiIndex]
                Image(systemName: "square.fill")
                    .resizable()
                    .foregroundStyle(confettiColor)
                    .rotationEffect(.degrees(.random(in: 0..<90)))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10)
                    .offset(
                        x: initialConfettiOffset.x,
                        y: initialConfettiOffset.y + confettiOffsetY
                    )
                    .opacity(confettiOpacity)
            }
        }
        .animation(.linear(duration: 10.0).repeatForever(autoreverses: false), value: isConfettiAnimated)
        .onAppear {
            isConfettiAnimated = true
        }
        .onDisappear {
            isConfettiAnimated = false
        }
    }

    var grawlix: some View {
        ZStack {
            Image(systemName: "square.fill")
                .resizable()
                .foregroundStyle(grawlixBackgroundColor)
                .frame(width: 220, height: 60)
            HStack {
                ForEach(["figure.flexibility", "dollarsign", "exclamationmark", "grid", "percent"], id: \.self) { imageName in
                    Image(systemName: imageName)
                        .resizable()
                        .fontWeight(.bold)
                        .foregroundStyle(grawlixTextColor)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                }
            }
        }
        .offset(y: 30)
        .ios18Animation(.bounce)
    }

    var explode: some View {
        ZStack {
            ForEach(0..<10, id: \.self) { _ in
                Image(systemName: "cloud.fill")
                    .resizable()
                    .foregroundStyle(smokeColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat.random(in: 50...100))
                    .offset(
                        x: CGFloat.random(in: -200...200),
                        y: CGFloat.random(in: -300...(-150))
                    )
                    .ios18Animation(.breath)
            }
        }
    }
}

#Preview {
    FumiEmotionalEmissionView(vm: .init())
}
