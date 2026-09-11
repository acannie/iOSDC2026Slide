//
//  01_Title.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/09/12.
//

import SwiftUI

struct Title: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 80) {
            Spacer()
            Text("SF Symbols を並べれば美少女も3Dも描ける！\nアセット不使用謹製アプリで表現革命")
                .font(.system(size: 60, weight: .bold))
            Text("ささおか あかね（@sasaoka_akane）")
                .font(.system(size: 50, weight: .bold))
            Spacer()
        }
        .overlay {
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(-5))
                    Spacer()
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundStyle(.pink)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(5))
                }
                Spacer()
                HStack {
                    Image(systemName: "rainbow")
                        .resizable()
                        .symbolRenderingMode(.multicolor)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(-5))
                    Spacer()
                    Image(systemName: "cloud.fill")
                        .resizable()
                        .foregroundStyle(.cyan)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(5))
                }
            }
        }
    }
}
