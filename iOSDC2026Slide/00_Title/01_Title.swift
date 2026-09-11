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
            Text("SF Symbols を並べれば美少女も3Dも描ける！\nアセット不使用謹製アプリで表現革命")
                .font(.system(size: 60, weight: .bold))
            Text("ささおか あかね（@sasaoka_akane）")
                .font(.system(size: 50, weight: .bold))
        }
    }
}
