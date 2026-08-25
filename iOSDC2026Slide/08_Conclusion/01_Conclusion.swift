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

    var body: some View {
        VStack(spacing: 80) {
            thankYouForListening
            HStack(alignment: .top, spacing: 128) {
                profile
                VStack(alignment: .center, spacing: 64) {
                    sourceCodeQr
                    symbolKanojoApp
                }
            }
        }
        .onAppear {
            isCrackerPoping = true
        }
    }
}

private extension Conclusion {
    var thankYouForListening: some View {
        HStack(spacing: 20) {
            Image(systemName: "party.popper")
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(isCrackerPoping ? .conclusionCrackerBlue : .clear, .conclusionCrackerPink)
                .rotation3DEffect((.degrees(180)), axis: (0, 1, 0))
                .scaledToFit()
                .frame(width: 60, height: 60)
            Text("ご清聴ありがとうございました")
                .font(.system(size: 70, weight: .heavy, design: .rounded))
                .foregroundStyle(.conclusionTitle)
            Image(systemName: "party.popper")
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(isCrackerPoping ? .conclusionCrackerBlue : .clear, .conclusionCrackerPink)
                .scaledToFit()
                .frame(width: 60, height: 60)
        }
        .animation(
            .easeInOut.repeatForever(autoreverses: true),
            value: isCrackerPoping
        )
    }

    var profile: some View {
        VStack {
            sectionTitle("発表者")
            Image("acannie")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.conclusionThumbnailBorder, lineWidth: 2)
                )
            VStack(spacing: 4) {
                Text("ささおか あかね")
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                    .foregroundStyle(.commonText)
                HStack {
                    Text("𝕏")
                        .foregroundStyle(.white)
                        .font(.system(size: 40))
                        .padding(16)
                        .background(
                            Circle()
                                .fill(.black)
                        )
                    Text("@sasaoka_akane")
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .foregroundStyle(.commonText)
                }
            }
        }
    }

    var sourceCodeQr: some View {
        VStack(spacing: 16) {
            sectionTitle("スライドのソースコード")
            Image(uiImage: generateQRCode(from: "https://github.com/acannie/iOSDC2026Slide"))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }

    var symbolKanojoApp: some View {
        VStack(alignment: .center, spacing: 16) {
            sectionTitle("配信中アプリのご案内")
            HStack(spacing: 32) {
                BustUpKanojoView(
                    kanojoParts: Fumi(
                        faceViewModel: .init(),
                        eyebrowsViewModel: .init(),
                        eyesViewModel: .init(),
                        mouthViewModel: .init(),
                        costumeViewModel: .init(),
                        faceMaskViewModel: .init(),
                        accessoriesViewModel: .init(),
                        emotionalEmissionViewModel: .init(),
                        gestureViewModel: .init()
                    ),
                    scale: 1.0,
                    isUpsideDown: false
                )
                .scaleEffect(0.2)
                .frame(width: 120, height: 120)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .conclusionSymbolKanojoAppBackgroundBlue,
                                    .conclusionSymbolKanojoAppBackgroundPink,
                                    .conclusionSymbolKanojoAppBackgroundYellow,
                                    .conclusionSymbolKanojoAppBackgroundGreen
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                )
                VStack(alignment: .leading, spacing: 12) {
                    Text("App Store にて配信中！")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(.commonText)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .fontWeight(.bold)
                            .foregroundStyle(.gray)
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Text("シンボルカノジョ。")
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundStyle(.commonText)
                    }
                }
            }
            .padding(.leading, 24)
        }
    }

    func sectionTitle(_ text: String) -> some View {
        Text("【\(text)】")
            .font(.system(size: 40, weight: .semibold, design: .rounded))
            .foregroundStyle(.commonText)
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
