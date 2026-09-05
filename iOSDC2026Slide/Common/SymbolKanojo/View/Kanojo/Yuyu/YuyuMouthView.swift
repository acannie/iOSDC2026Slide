//
//  YuyuMouthView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct YuyuMouthView: MouthView {
    @ObservedObject var vm: YuyuMouthViewModel

    @State private(set) var isZipperMouthAnimated = false
    @State private(set) var isTongueAnimated = false

    var tongueType: MouthType.TongueType? {
        switch vm.expression {
        case .smile(_, let tongueType):
            tongueType
        case .happy(_, let tongueType):
            tongueType
        case .wailing(_, let tongueType):
            tongueType
        default:
            nil
        }
    }
    var tongueOffset: CGPoint {
        switch vm.expression {
        case .smile(let size, _):
            let mouthOffsetY: CGFloat = switch size {
            case .small: 35
            case .medium: 30
            case .large: 20
            }
            return .init(x: 30, y: mouthOffsetY)
        case .happy:
            return .init(x: 0, y: 30)
        case .wailing:
            return .init(x: 0, y: 30)
        default:
            return .zero
        }
    }

    var body: some View {
        ZStack {
            switch vm.expression {
            case .neutral(let size), .tilted(let size):
                neutralMouth(size: size)
            case .smile(let size, let tongueType):
                smileMouth(size: size, tongueType: tongueType)
            case .dissatisfaction(let size):
                dissatisfactionMouth(size: size)
            case .surprise(let size):
                surpriseMouth(size: size)
            case .happy(let size, let tongueType):
                happyMouth(size: size, tongueType: tongueType)
            case .smileMischievously(let size):
                smileMischievously(size: size)
            case .wailing(let size, let tongueType):
                wailingMouth(size: size, tongueType: tongueType)
            case .defeated:
                defeatedMouth()
            case .kiss:
                kissingMouth
            case .zipper:
                zipperMouth()
            case .grittedTeeth:
                grittedTeethMouth()
            }
        }
        tongue
    }
}

private extension YuyuMouthView {
    func neutralMouth(size: MouthType.MouthSize) -> some View {
        let mouthWidth: CGFloat = switch size {
        case .small: .zero
        case .medium: 50
        case .large: 70
        }
        let angle: Angle = switch vm.expression {
        case .neutral: .zero
        case .tilted: .degrees(-10)
        default: .zero
        }
        let offsetY: CGFloat = switch vm.expression {
        case .neutral: 30.0
        case .tilted: 25.0
        default: 30.0
        }
        return Image(systemName: "minus")
            .resizable()
            .foregroundStyle(.yuyuLip)
            .rotationEffect(angle)
            .frame(width: mouthWidth, height: 5)
            .offset(y: offsetY)
    }

    func smileMouth(size: MouthType.MouthSize, tongueType: MouthType.TongueType?) -> some View {
        let mouthSize: CGSize = switch size {
        case .small: .zero
        case .medium: .init(width: 50, height: 15)
        case .large: .init(width: 80, height: 25)
        }
        let mouthOffsetY: CGFloat = switch size {
        case .small: 30
        case .medium: 25
        case .large: 20
        }
        return ZStack {
            Image(systemName: "chevron.compact.down")
                .resizable()
                .foregroundStyle(.yuyuLip)
                .frame(width: mouthSize.width, height: mouthSize.height)
                .offset(y: mouthOffsetY)
        }
    }

    func smileMischievously(size: MouthType.MouthSize) -> some View {
        let mouthSize: CGSize = switch size {
        case .small: .zero
        case .medium: .init(width: 50, height: 15)
        case .large: .init(width: 80, height: 25)
        }
        let mouthOffsetY: CGFloat = switch size {
        case .small: 35
        case .medium: 30
        case .large: 25
        }
        return ZStack {
            Image(systemName: "externaldrive.fill")
                .resizable()
                .foregroundStyle(.yuyuToothLight)
            Image(systemName: "externaldrive")
                .resizable()
                .foregroundStyle(.yuyuToothDark)
        }
        .rotationEffect(.degrees(180))
        .frame(width: mouthSize.width, height: mouthSize.height)
        .offset(y: mouthOffsetY)
    }

    func dissatisfactionMouth(size: MouthType.MouthSize) -> some View {
        let mouthSize: CGSize = switch size {
        case .small: .zero
        case .medium: .init(width: 50, height: 15)
        case .large: .init(width: 60, height: 20)
        }
        let mouthOffsetY: CGFloat = switch size {
        case .small: 35
        case .medium: 30
        case .large: 25
        }
        return Image(systemName: "chevron.compact.up")
            .resizable()
            .foregroundStyle(.yuyuLip)
            .frame(width: mouthSize.width, height: mouthSize.height)
            .offset(y: mouthOffsetY)
    }

    func surpriseMouth(size: MouthType.MouthSize) -> some View {
        let mouthSize: CGSize = switch size {
        case .small: .init(width: 20, height: 25)
        case .medium: .init(width: 30, height: 35)
        case .large: .init(width: 40, height: 45)
        }
        return Image(systemName: "circle.fill")
            .resizable()
            .foregroundStyle(.yuyuMouth)
            .frame(width: mouthSize.width, height: mouthSize.height)
            .offset(y: 30)
    }

    func happyMouth(size: MouthType.MouthSize, tongueType: MouthType.TongueType?) -> some View {
        let mouthSize: CGSize = switch size {
        case .small: .zero
        case .medium: .init(width: 60, height: 20)
        case .large: .init(width: 80, height: 30)
        }
        return ZStack {
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .foregroundStyle(.yuyuMouth)
                .frame(width: mouthSize.width, height: mouthSize.height)
                .offset(y: 30)
        }
    }

    var tongue: some View {
        var angle: Angle {
            switch tongueType {
            case .licking:
                .degrees(-125)
            case .tongueOut:
                .degrees(-90)
            case .none:
                .zero
            }
        }
        var offsetY: CGFloat {
            width / 2
        }
        var width: CGFloat {
            switch tongueType {
            case .licking: 20
            case .tongueOut: isTongueAnimated ? 30 : 20
            case .none: .zero
            }
        }
        return ZStack {
            Image(systemName: "hockey.puck.fill")
                .resizable()
                .foregroundStyle(.yuyuTongueLight)
                .frame(width: width, height: 25)
            Image(systemName: "hockey.puck")
                .resizable()
                .fontWeight(.bold)
                .foregroundStyle(.yuyuTongueDark)
                .frame(width: width, height: 25)
        }
        .rotationEffect(angle)
        .offset(x: tongueOffset.x, y: tongueOffset.y + offsetY)
        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isTongueAnimated)
        .onChange(of: tongueType) {
            switch tongueType {
            case .tongueOut:
                isTongueAnimated = true
            case .licking, .none:
                isTongueAnimated = false
            }
        }
    }

    func smileMischievouslyMouth(size: MouthType.MouthSize) -> some View {
        ZStack {
            Image(systemName: "phone.down.fill")
                .resizable()
                .rotationEffect(.degrees(180))
                .foregroundStyle(.yuyuToothLight)
                .frame(width: 60, height: 20)
                .offset(y: 30)
            Image(systemName: "phone.down")
                .resizable()
                .rotationEffect(.degrees(180))
                .foregroundStyle(.yuyuLip)
                .frame(width: 60, height: 20)
                .offset(y: 30)
        }
    }

    func wailingMouth(size: MouthType.MouthSize, tongueType: MouthType.TongueType?) -> some View {
        let mouthHeight: CGFloat = switch size {
        case .small: 10
        case .medium: 20
        case .large: 40
        }
        return ZStack {
            Image(systemName: "button.roundedtop.horizontal.fill")
                .resizable()
                .foregroundStyle(.yuyuMouth)
                .frame(width: 60, height: mouthHeight)
                .offset(y: 30)
        }
    }

    func defeatedMouth() -> some View {
        Image(systemName: "stairs")
            .resizable()
            .fontWeight(.black)
            .foregroundStyle(.yuyuMouth)
            .frame(width: 50, height: 50)
            .rotationEffect(.degrees(45))
            .offset(y: 35)
    }

    var kissingMouth: some View {
        ZStack {
            Image(systemName: "chevron.compact.down")
                .resizable()
                .foregroundStyle(.yuyuLip)
                .frame(width: 40, height: 20)
                .offset(y: 30)
            Image(systemName: "hockey.puck.fill")
                .resizable()
                .rotationEffect(.degrees(180))
                .foregroundStyle(.yuyuLip)
                .frame(width: 30, height: 25)
                .offset(y: 30)
        }
    }

    func zipperMouth() -> some View {
        var zipperMouthWidth: CGFloat {
            isZipperMouthAnimated ? 1.0 : 80.0
        }
        var zipperMouthHeight: CGFloat {
            isZipperMouthAnimated ? 1.0 : 30.0
        }
        var zipperMouthOffsetX: CGFloat {
            isZipperMouthAnimated ? 40.0 : 0.0
        }
        var zipperTeethWidth: CGFloat {
            max(80.0 - zipperMouthWidth, 1.0)
        }
        var zipperTeethOffsetX: CGFloat {
            -40.0 + zipperMouthOffsetX
        }
        var zipperPullOffsetX: CGFloat {
            isZipperMouthAnimated ? 40.0 : -40.0
        }
        return ZStack {
            // 口の部分
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(.yuyuMouth)
                .frame(width: zipperMouthWidth, height: zipperMouthHeight)
                .offset(x: zipperMouthOffsetX)
                .offset(y: 30)
            // ジッパーの部分
            Image(systemName: "minus")
                .resizable()
                .foregroundStyle(.gray)
                .frame(width: zipperTeethWidth, height: 5)
                .offset(x: zipperTeethOffsetX)
                .offset(y: 30)
            // ジッパーの持ち手
            Image(systemName: "opticaldiscdrive.fill")
                .resizable()
                .foregroundStyle(.gray)
                .frame(width: 10, height: 20)
                .offset(x: zipperPullOffsetX)
                .offset(y: 35)
        }
        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isZipperMouthAnimated)
        .onAppear {
            isZipperMouthAnimated = true
        }
        .onDisappear {
            isZipperMouthAnimated = false
        }
    }

    func grittedTeethMouth() -> some View {
        ZStack {
            Image(systemName: "snowboard.fill")
                .resizable()
                .foregroundStyle(.yuyuToothLight)
                .rotationEffect(.degrees(45))
                .frame(width: 60, height: 60)
                .offset(y: 30)
            Image(systemName: "snowboard")
                .resizable()
                .foregroundStyle(.yuyuToothDark)
                .rotationEffect(.degrees(45))
                .frame(width: 60, height: 60)
                .offset(y: 30)
        }
    }
}

#Preview {
    YuyuMouthView(vm: .init())
}
