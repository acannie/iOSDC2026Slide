//
//  Kanojo2MouthView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/04/22.
//

import SwiftUI

struct Kanojo2MouthView: MouthView {
    private let lipColor = Color("fumi_lip")

    var body: some View {
        ZStack {
            Image(systemName: "minus")
//            Image(systemName: "chevron.compact.down")
                .resizable()
                .foregroundStyle(lipColor)
                .frame(width: 40, height: 5)
                .offset(y: 30)
        }
    }
}

#Preview {
    Kanojo2MouthView()
}
