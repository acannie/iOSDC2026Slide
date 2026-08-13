//
//  02_Interpreting.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct Interpreting: View {
    let isActive: Bool
    @State private var isShowingWhole: Bool = false

    var body: some View {
        VStack {
            title
            HStack(spacing: 200) {
                if isShowingWhole {
                    lotus
                }
                elephant
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                isShowingWhole = true
            }
        }
        .onChange(of: isActive) {
            isShowingWhole = false
        }
    }

    var title: some View {
        HStack {
            Text("解釈する")
                .font(.system(size: 100))
            Spacer()
        }
        .padding(.horizontal, 48)
    }

    var lotus: some View {
        ZStack {
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "chart.pie.fill")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .foregroundColor(.lotusLeaf)
                    .rotationEffect(.degrees(side.unit * 95), anchor: .bottom)
            }
            .offset(y: -10)
            Image(systemName: "drop.fill")
                .resizable()
                .frame(width: 50, height: 100)
                .foregroundColor(.lotus5)
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .foregroundColor(.lotus4)
                    .rotationEffect(.degrees(side.unit * 10), anchor: .bottom)
            }
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .foregroundColor(.lotus3)
                    .rotationEffect(.degrees(side.unit * 20), anchor: .bottom)
            }
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .foregroundColor(.lotus2)
                    .rotationEffect(.degrees(side.unit * 40), anchor: .bottom)
            }
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 40, height: 120)
                    .foregroundColor(.lotus1)
                    .rotationEffect(.degrees(side.unit * 70), anchor: .bottom)
                    .offset(x: side.unit * -20, y: -10)
            }
        }
    }

    var elephant: some View {
        ZStack {
            Image(systemName: "button.angledbottom.horizontal.right.fill")
                .resizable()
                .rotationEffect(.degrees(180))
                .frame(width: 180, height: 120)
                .foregroundStyle(.elephantLight)
            Rectangle()
                .frame(width: 30, height: 60)
                .foregroundStyle(.elephantLight)
                .offset(x: 60, y: 80)
            Rectangle()
                .frame(width: 30, height: 60)
                .foregroundStyle(.elephantLight)
                .offset(x: -35, y: 80)
            Rectangle()
                .frame(width: 30, height: 60)
                .foregroundStyle(.elephantLight)
                .offset(x: -70, y: 80)
            Rectangle()
                .frame(width: 30, height: 40)
                .foregroundStyle(.elephantLight)
                .rotationEffect(.degrees(-45))
                .offset(x: 90, y: 50)
            // 動く前足
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 30, height: 40)
                .foregroundStyle(.elephantLight)
                .rotationEffect(.degrees(15), anchor: .topTrailing)
                .offset(x: 100, y: 70)
            // 尾
            Text("ノ")
                .font(.system(size: 60, weight: .bold))
                .foregroundStyle(.elephantLight)
                .rotationEffect(.degrees(15), anchor: .topTrailing)
                .offset(x: -95, y: 5)
            // 頭
            Image(systemName: "button.angledtop.vertical.left.fill")
                .resizable()
                .rotationEffect(.degrees(90))
                .frame(width: 80, height: 100)
                .foregroundStyle(.elephantLight)
                .offset(x: 70, y: -20)
            // 鼻
            Text("つ")
                .font(.system(size: 60, weight: .black))
                .foregroundStyle(.elephantLight)
                .rotationEffect(.degrees(15), anchor: .topLeading)
                .offset(x: 140, y: 20)
            // 目
            Circle()
                .foregroundStyle(.elephantEye)
                .frame(width: 10, height: 10)
                .offset(x: 80, y: -30)
            // 牙
            Image(systemName: "moon.fill")
                .resizable()
                .rotationEffect(.degrees(-30))
                .frame(width: 40, height: 40)
                .foregroundStyle(.elephantFang)
                .offset(x: 90, y: 15)
            // 鞍
            Image(systemName: "crown.fill")
                .resizable()
                .rotationEffect(.degrees(165))
                .frame(width: 80, height: 70)
                .foregroundStyle(.elephantSaddle)
                .offset(x: -25, y: -15)
            // 耳
            Image(systemName: "button.angledtop.vertical.right.fill")
                .resizable()
                .frame(width: 50, height: 70)
                .foregroundStyle(.elephantDark)
                .rotationEffect(.degrees(180))
                .offset(x: 25, y: -20)
        }
    }
}
