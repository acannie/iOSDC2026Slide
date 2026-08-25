//
//  ClaudeGirlView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

// MARK: - メインView
// SF Symbols / Shape / システムフォント(SF Rounded) を組み合わせて
// 「肩から上」のかわいいアニメ風女の子の顔を作ります。
// カラーや数値をプロパティにしているので、好みに合わせて差し替え可能です。

struct ClaudeGirlView: View {
    // カスタム可能なカラー
    var skinColor      = Color(red: 1.00, green: 0.88, blue: 0.78)
    var hairColor       = Color(red: 0.54, green: 0.42, blue: 0.69)
    var hairShadowColor = Color(red: 0.42, green: 0.32, blue: 0.56)
    var eyeColor        = Color(red: 0.36, green: 0.56, blue: 0.84)
    var clothColor      = Color(red: 0.91, green: 0.45, blue: 0.55)
    var blushColor      = Color.pink
    var ribbonColor     = Color(red: 0.96, green: 0.78, blue: 0.27)

    var body: some View {
        ZStack {
            shoulders
            neck
            hairBack
            face
            ears
            blush
            eyebrows
            eyesRow
            nose
            mouth
            hairFront
            ribbon
        }
    }

    // MARK: 肩・服 (体)
    private var shoulders: some View {
        TrapezoidShape()
            .fill(
                LinearGradient(colors: [clothColor, clothColor.opacity(0.75)],
                                startPoint: .top, endPoint: .bottom)
            )
            .frame(width: 260, height: 140)
            .offset(y: 175)
    }

    // MARK: 首
    private var neck: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(skinColor)
            .frame(width: 44, height: 60)
            .offset(y: 115)
    }

    // MARK: 後ろ髪 (顔より大きい円で下地を作る)
    private var hairBack: some View {
        Circle()
            .fill(hairColor)
            .frame(width: 250, height: 250)
            .offset(y: 10)
    }

    // MARK: 顔 (輪郭は独自Shape / 丸い頬・やや尖った顎)
    private var face: some View {
        FaceShape()
            .fill(skinColor)
            .frame(width: 190, height: 205)
            .offset(y: 5)
    }

    // MARK: 耳
    private var ears: some View {
        HStack(spacing: 188) {
            Ellipse().fill(skinColor).frame(width: 26, height: 34)
            Ellipse().fill(skinColor).frame(width: 26, height: 34)
        }
        .offset(y: 15)
    }

    // MARK: 頬の赤み (円 + blur でふんわり)
    private var blush: some View {
        HStack(spacing: 108) {
            Circle().fill(blushColor.opacity(0.45)).frame(width: 32, height: 20).blur(radius: 6)
            Circle().fill(blushColor.opacity(0.45)).frame(width: 32, height: 20).blur(radius: 6)
        }
        .offset(y: 35)
    }

    // MARK: 眉
    private var eyebrows: some View {
        HStack(spacing: 66) {
            Capsule().fill(hairShadowColor).frame(width: 32, height: 6).rotationEffect(.degrees(-6))
            Capsule().fill(hairShadowColor).frame(width: 32, height: 6).rotationEffect(.degrees(6))
        }
        .offset(y: -32)
    }

    // MARK: 目 (大きな瞳 + SF Symbolの sparkle でハイライト)
    private var eyesRow: some View {
        HStack(spacing: 54) {
            eyeView
            eyeView
        }
        .offset(y: -2)
    }

    private var eyeView: some View {
        ZStack {
            // 白目
            Ellipse()
                .fill(Color.white)
                .frame(width: 36, height: 44)
            // 虹彩
            Circle()
                .fill(
                    RadialGradient(colors: [eyeColor.opacity(0.7), eyeColor],
                                    center: .center, startRadius: 1, endRadius: 16)
                )
                .frame(width: 27, height: 33)
            // 瞳孔
            Circle().fill(Color.black).frame(width: 12, height: 14)
            // ハイライト (SF Symbol: sparkle)
            Image(systemName: "sparkle")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundStyle(.white)
                .offset(x: -6, y: -9)
            // 小さい白点ハイライト
            Circle().fill(Color.white.opacity(0.85)).frame(width: 5, height: 5).offset(x: 6, y: 7)
            // 輪郭線
            Ellipse()
                .stroke(Color.black.opacity(0.8), lineWidth: 2)
                .frame(width: 36, height: 44)
        }
    }

    // MARK: 鼻 (小さなカプセルで最小限に)
    private var nose: some View {
        Capsule()
            .fill(Color.black.opacity(0.18))
            .frame(width: 3, height: 7)
            .offset(y: 18)
    }

    // MARK: 口 (SF Rounded フォントの文字でシンプルな笑顔)
    private var mouth: some View {
        Text("‿")
            .font(.system(size: 24, weight: .semibold, design: .rounded))
            .foregroundStyle(.black.opacity(0.7))
            .offset(y: 40)
    }

    // MARK: 前髪 (独自Shapeの前髪 + サイドの髪 + SF Symbolの sparkles でツヤ表現)
    private var hairFront: some View {
        ZStack {
            BangsShape()
                .fill(hairColor)
                .frame(width: 210, height: 130)
                .offset(y: -85)

            SideHairShape()
                .fill(hairColor)
                .frame(width: 58, height: 220)
                .offset(x: -108, y: -8)

            SideHairShape()
                .fill(hairColor)
                .frame(width: 58, height: 220)
                .scaleEffect(x: -1, y: 1)
                .offset(x: 108, y: -8)

            // 髪のツヤ (SF Symbol)
            Image(systemName: "sparkles")
                .font(.system(size: 16))
                .foregroundStyle(.white.opacity(0.85))
                .offset(x: 42, y: -112)
        }
    }

    // MARK: リボン (SF Symbol: star.fill をアクセントに)
    private var ribbon: some View {
        Image(systemName: "star.fill")
            .font(.system(size: 18))
            .foregroundStyle(ribbonColor)
            .rotationEffect(.degrees(-15))
            .offset(x: -70, y: -100)
    }
}

// MARK: - カスタムShape群

/// 顔の輪郭 (丸い頬・やわらかい顎のライン)
struct FaceShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        path.move(to: CGPoint(x: 0, y: h * 0.35))
        path.addCurve(to: CGPoint(x: w * 0.5, y: 0),
                       control1: CGPoint(x: 0, y: h * 0.05),
                       control2: CGPoint(x: w * 0.2, y: 0))
        path.addCurve(to: CGPoint(x: w, y: h * 0.35),
                       control1: CGPoint(x: w * 0.8, y: 0),
                       control2: CGPoint(x: w, y: h * 0.05))
        path.addCurve(to: CGPoint(x: w * 0.5, y: h),
                       control1: CGPoint(x: w, y: h * 0.75),
                       control2: CGPoint(x: w * 0.7, y: h))
        path.addCurve(to: CGPoint(x: 0, y: h * 0.35),
                       control1: CGPoint(x: w * 0.3, y: h),
                       control2: CGPoint(x: 0, y: h * 0.75))
        path.closeSubpath()
        return path
    }
}

/// 肩・服の台形シルエット
struct TrapezoidShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        path.move(to: CGPoint(x: w * 0.25, y: 0))
        path.addLine(to: CGPoint(x: w * 0.75, y: 0))
        path.addLine(to: CGPoint(x: w, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.closeSubpath()
        return path
    }
}

/// 前髪 (ゆるやかな波型の下端)
struct BangsShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        path.move(to: CGPoint(x: 0, y: h * 0.3))
        path.addCurve(to: CGPoint(x: w, y: h * 0.3),
                       control1: CGPoint(x: w * 0.3, y: -h * 0.1),
                       control2: CGPoint(x: w * 0.7, y: -h * 0.1))
        path.addCurve(to: CGPoint(x: w * 0.75, y: h * 0.55),
                       control1: CGPoint(x: w * 0.9, y: h * 0.5),
                       control2: CGPoint(x: w * 0.85, y: h * 0.6))
        path.addCurve(to: CGPoint(x: w * 0.5, y: h * 0.45),
                       control1: CGPoint(x: w * 0.65, y: h * 0.5),
                       control2: CGPoint(x: w * 0.6, y: h * 0.4))
        path.addCurve(to: CGPoint(x: w * 0.25, y: h * 0.55),
                       control1: CGPoint(x: w * 0.4, y: h * 0.5),
                       control2: CGPoint(x: w * 0.35, y: h * 0.6))
        path.addCurve(to: CGPoint(x: 0, y: h * 0.3),
                       control1: CGPoint(x: w * 0.15, y: h * 0.5),
                       control2: CGPoint(x: w * 0.1, y: h * 0.4))
        path.closeSubpath()
        return path
    }
}

/// サイドの髪の束 (左側基準。右側は scaleEffect(x: -1) で反転して使用)
struct SideHairShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        path.move(to: CGPoint(x: w, y: 0))
        path.addCurve(to: CGPoint(x: w * 0.2, y: h * 0.5),
                       control1: CGPoint(x: w * 0.3, y: h * 0.05),
                       control2: CGPoint(x: 0, y: h * 0.3))
        path.addCurve(to: CGPoint(x: w * 0.6, y: h),
                       control1: CGPoint(x: w * 0.4, y: h * 0.7),
                       control2: CGPoint(x: w * 0.3, y: h * 0.9))
        path.addLine(to: CGPoint(x: w, y: h * 0.8))
        path.closeSubpath()
        return path
    }
}

// MARK: - プレビュー
#Preview {
    ClaudeGirlView()
}
