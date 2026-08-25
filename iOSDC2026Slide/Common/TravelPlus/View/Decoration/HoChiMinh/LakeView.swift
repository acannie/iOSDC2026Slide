//
//  LakeView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct LakeView: View {
    private let lakeColor = Color("hoChiMinh_lake")
    private let lotusLeaf = Color("hoChiMinh_lotus_leaf")

    @State private var isLakeAnimated: Bool = false

    var body: some View {
        ZStack {
            //湖
            Rectangle()
                .foregroundStyle(lakeColor)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .offset(y: 400)
            // 蓮
            LotusView()
                .scaleEffect(0.15)
                .offset(x: 35, y: 300)
                .offset(x: isLakeAnimated ? -1 : 1)
            LotusView()
                .scaleEffect(0.2)
                .offset(x: -50, y: 300)
                .offset(x: isLakeAnimated ? 1 : -1)
            LotusView()
                .scaleEffect(0.4)
                .offset(x: -130, y: 300)
                .offset(x: isLakeAnimated ? -2 : 2)
            LotusView()
                .scaleEffect(0.6)
                .offset(x: -20, y: 350)
                .offset(x: isLakeAnimated ? 4 : -4)
            LotusView()
                .scaleEffect(0.7)
                .offset(x: -160, y: 390)
                .offset(x: isLakeAnimated ? -5 : 5)
            // 葉
            Image(systemName: "chart.pie.fill")
                .resizable()
                .frame(width: 50, height: 25)
                .foregroundColor(lotusLeaf)
                .offset(x: -110, y: 360)
        }
        .animation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true), value: isLakeAnimated)
        .onAppear {
            isLakeAnimated = true
        }
    }
}
