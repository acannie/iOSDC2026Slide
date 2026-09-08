//
//  BlackboardView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/09/07.
//

import SwiftUI

struct BlackboardView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Today's Menu")
                .font(.system(size: 24, weight: .bold, design: .serif))
                .foregroundStyle(.blackboardChokeWhite)
            HStack(spacing: 12) {
                VStack(alignment: .trailing) {
                    ForEach(["Cappuccino ", "Espresso", "Latte   "], id: \.self) { item in
                        Text(item)
                            .font(.system(size: 22, weight: .thin, design: .serif))
                            .foregroundStyle(.blackboardChokeWhite)
                    }
                }
                Image(systemName: "cup.and.saucer.fill")
                    .resizable()
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blackboardChokeWhite, .blackboardChokeYellow)
                    .frame(width: 60, height: 40)
            }
        }
        .blur(radius: 1)
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(.blackboardBoard)
                .stroke(.blackboardEdge, lineWidth: 16)
                .frame(width: 260, height: 160)
        )
    }
}
