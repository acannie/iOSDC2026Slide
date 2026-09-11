//
//  01_Conclusion.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct Conclusion: View {
    @State private var isCrackerPoping: Bool = false
    @State private var isYuyuLookingAbove: Bool = false
    @ObservedObject private var yuyuVM = YuyuViewModel()

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                thankYouForListening
                    .padding(.top, 64)
                Spacer()
                HStack(alignment: .top, spacing: 200) {
                    xProfile
                    sourceCodeQr
                        .offset(y: -50)
                }
                Spacer()
                Spacer()
                Spacer()
            }
            KanojoView(
                kanojoParts: yuyuVM.parts,
                scale: 1.0,
                isUpsideDown: yuyuVM.activeAction == .turnUpsideDown
            )
            .offset(y: 300)
            yuyuArms
        }
        .onAppear {
            isYuyuLookingAbove = true
            isCrackerPoping = true
        }
        .onChange(of: isYuyuLookingAbove) {
            if isYuyuLookingAbove {
                withAnimation(.easeInOut) {
                    yuyuVM.express(.init(faceType: .neutral, eyebrowsType: .neutral, eyesType: .normal(.surprise, .normal, .top), mouthType: .smile(.medium, .licking)))
                }
            }
        }
    }
}

private extension Conclusion {
    var yuyuArms: some View {
        var nail: some View {
            Image(systemName: "capsule.portrait.fill")
                .resizable()
                .foregroundStyle(.yuyuNail)
        }
        return ZStack {
            ForEach(Side.allCases, id: \.self) { side in
                Group {
                    Group {
                        // 手
                        Image(systemName: "hand.point.up.fill")
                            .resizable()
                            .foregroundStyle(.yuyuSkinMiddle)
                            .frame(width: 140, height: 190)
                        // 爪
                        nail
                            .rotationEffect(.degrees(side.unit * -15))
                            .frame(width: 16, height: 24)
                            .offset(x: 5, y: 38)
                        nail
                            .rotationEffect(.degrees(side.unit * -10))
                            .frame(width: 16, height: 24)
                            .offset(x: 30, y: 40)
                        nail
                            .rotationEffect(.degrees(side.unit * -10))
                            .frame(width: 14, height: 24)
                            .offset(x: 55, y: 35)
                    }
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
                .rotation3DEffect(
                    .degrees(side == .left ? 180 : 0),
                    axis: (x: 0, y: 90, z: 0)
                )
                .rotationEffect(.degrees(side.unit * 5))
                .offset(x: side.unit * 360, y: 430)
            }
        }
    }

    var thankYouForListening: some View {
        HStack(spacing: 20) {
            Image("acannie")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.conclusionThumbnailBorder, lineWidth: 8)
                )
            Text("ご清聴ありがとうございました")
                .font(.system(size: 80, weight: .heavy, design: .rounded))
                .foregroundStyle(.conclusionTitle)
            Image(systemName: "party.popper")
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(isCrackerPoping ? .conclusionCrackerBlue : .clear, .conclusionCrackerPink)
                .scaledToFit()
                .frame(width: 70, height: 70)
        }
        .animation(
            .easeInOut.repeatForever(autoreverses: true),
            value: isCrackerPoping
        )
    }

    var xProfile: some View {
        VStack {
            Text("フォローしてね♪")
                .foregroundStyle(.gray)
                .font(.system(size: 50, weight: .bold))
            Text("@sasaoka_akane")
                .foregroundStyle(.black)
                .font(.system(size: 80, weight: .bold))
        }
        .rotationEffect(.degrees(-5))
    }

    var sourceCodeQr: some View {
        VStack(spacing: 16) {
            Image(uiImage: generateQRCode(from: "https://github.com/acannie/iOSDC2026Slide"))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("スライドのソースコード")
                .font(.system(size: 40, weight: .semibold, design: .rounded))
                .foregroundStyle(.commonText)
        }
        .rotationEffect(.degrees(5))
    }
}

private extension Conclusion {
    func generateQRCode(from string: String) -> UIImage {
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledImage = outputImage.transformed(by: transform)
            let context = CIContext()
            if let cgImage = context.createCGImage(scaledImage, from: scaledImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
