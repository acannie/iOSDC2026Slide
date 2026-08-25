//
//  PalmTreeView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct PalmTreeView: View {
    private let treeColor = Color("bangkok_palmTree_tree")
    private let leafColor = Color("bangkok_palmTree_leaf")
    
    @State private var isPalmTreeAnimated = false
    
    var body: some View {
        ZStack {
            Text("ノ")
                .font(.system(size: 100, weight: .bold, design: .default))
                .foregroundStyle(treeColor)
                .scaleEffect(x: 1.0, y: 6.5)
                .rotationEffect(.degrees(-10))
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(leafColor)
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(120))
                .offset(x: -45, y: -190)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(leafColor)
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(150))
                .offset(x: -55, y: -210)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(leafColor)
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(170))
                .offset(x: -45, y: -230)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(leafColor)
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(100))
                .offset(x: 20, y: -230)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(leafColor)
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(120))
                .offset(x: 20, y: -210)
            Image(systemName: "moon.fill")
                .resizable()
                .foregroundStyle(leafColor)
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(170))
                .offset(x: 20, y: -190)
        }
        .offset(x: 180, y: 300)
    }
}
