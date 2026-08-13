//
//  02_Interpreting.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/14.
//

import SwiftUI

struct Interpreting: View {
    let isActive: Bool
    @State private var isShowingWholeLotus: Bool = false
    @State private var isShowingWholeElephant: Bool = false

    var body: some View {
        VStack {
            title
            HStack(spacing: 50) {
                ZStack {
                    lotus
                        .opacity(isShowingWholeLotus ? 1 : 0)
                    chart
                        .onTapGesture {
                            isShowingWholeLotus = true
                        }
                }
                .frame(width: 600, height: 600)
                .animation(.easeInOut(duration: 2), value: isShowingWholeLotus)
                ZStack {
                    elephant
                        .opacity(isShowingWholeElephant ? 1 : 0)
                    tsu
                        .onTapGesture {
                            isShowingWholeElephant = true
                        }
                }
                .frame(width: 600, height: 600)
                .animation(.easeInOut(duration: 2), value: isShowingWholeElephant)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onChange(of: isActive) {
            isShowingWholeLotus = false
            isShowingWholeElephant = false
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

    var chart: some View {
        VStack(spacing: 16) {
            ZStack {
                Rectangle()
                    .fill(.clear)
                    .frame(width: 400, height: 400)
                Image(systemName: "chart.pie.fill")
                    .resizable()
                    .frame(
                        width: isShowingWholeLotus ? 100 : 300,
                        height: isShowingWholeLotus ? 200 : 300
                    )
                    .foregroundColor(isShowingWholeLotus ? .lotusLeaf : .black)
                    .rotationEffect(
                        .degrees(isShowingWholeLotus ? 95 : 0),
                        anchor: .bottom
                    )
                    .offset(
                        x: 0,
                        y: isShowingWholeLotus ? 120 : 0
                    )
            }
            Text("chart.pie.fill")
                .font(.system(size: 50, weight: .bold))
                .opacity(isShowingWholeLotus ? 0 : 1)
        }
    }

    var tsu: some View {
        VStack(spacing: 32) {
            Text("つ")
                .font(
                    .system(
                        size: isShowingWholeElephant ? 120 : 400,
                        weight: .black
                    )
                )
                .foregroundColor(isShowingWholeElephant ? .elephantLight : .black)
                .frame(width: 400, height: 400)
                .rotationEffect(
                    .degrees(isShowingWholeElephant ? 15 : 0),
                    anchor: .topLeading
                )
                .offset(
                    x: isShowingWholeElephant ? 320 : 0,
                    y: isShowingWholeElephant ? 40 : -45
                )
            Text("ひらがな")
                .font(.system(size: 50, weight: .bold))
                .opacity(isShowingWholeElephant ? 0 : 1)
                .offset(y: -45)
        }
    }

    var lotus: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.cyan, .clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 500, height: 200)
                .offset(y: 170)
            Image(systemName: "chart.pie.fill")
                .resizable()
                .frame(width: 75, height: 150)
                .foregroundColor(.lotusLeaf)
                .rotationEffect(.degrees(-95), anchor: .bottom)
                .offset(x: -75, y: 35)
            Image(systemName: "chart.pie.fill")
                .resizable()
                .frame(width: 100, height: 50)
                .foregroundColor(.lotusLeaf)
                .offset(x: 160, y: 85)
//            Image(systemName: "chart.pie.fill")
//                .resizable()
//                .frame(width: 100, height: 200)
//                .foregroundColor(.lotusLeaf)
//                .rotationEffect(.degrees(95), anchor: .bottom)
//                .offset(x: 0, y: 80)
            Group {
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 100, height: 200)
                    .foregroundColor(.lotus5)
                ForEach(Side.allCases, id: \.self) { side in
                    Image(systemName: "drop.fill")
                        .resizable()
                        .frame(width: 100, height: 200)
                        .foregroundColor(.lotus4)
                        .rotationEffect(.degrees(side.unit * 10), anchor: .bottom)
                }
                ForEach(Side.allCases, id: \.self) { side in
                    Image(systemName: "drop.fill")
                        .resizable()
                        .frame(width: 100, height: 200)
                        .foregroundColor(.lotus3)
                        .rotationEffect(.degrees(side.unit * 20), anchor: .bottom)
                }
                ForEach(Side.allCases, id: \.self) { side in
                    Image(systemName: "drop.fill")
                        .resizable()
                        .frame(width: 100, height: 200)
                        .foregroundColor(.lotus2)
                        .rotationEffect(.degrees(side.unit * 40), anchor: .bottom)
                }
                ForEach(Side.allCases, id: \.self) { side in
                    Image(systemName: "drop.fill")
                        .resizable()
                        .frame(width: 100, height: 200)
                        .foregroundColor(.lotus1)
                        .rotationEffect(.degrees(side.unit * 70), anchor: .bottom)
                        .offset(x: side.unit * -40, y: -20)
                }
            }
            .offset(x: -60)
        }
    }

    var elephant: some View {
        ZStack {
            Image(systemName: "button.angledbottom.horizontal.right.fill")
                .resizable()
                .rotationEffect(.degrees(180))
                .frame(width: 360, height: 240)
                .foregroundStyle(.elephantLight)
            Rectangle()
                .frame(width: 60, height: 120)
                .foregroundStyle(.elephantLight)
                .offset(x: 120, y: 160)
            Rectangle()
                .frame(width: 60, height: 120)
                .foregroundStyle(.elephantLight)
                .offset(x: -70, y: 160)
            Rectangle()
                .frame(width: 60, height: 120)
                .foregroundStyle(.elephantLight)
                .offset(x: -140, y: 160)
            Rectangle()
                .frame(width: 60, height: 80)
                .foregroundStyle(.elephantLight)
                .rotationEffect(.degrees(-45))
                .offset(x: 180, y: 100)
            // 動く前足
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 60, height: 80)
                .foregroundStyle(.elephantLight)
                .rotationEffect(.degrees(15), anchor: .topTrailing)
                .offset(x: 200, y: 140)
            // 尾
            Text("ノ")
                .font(.system(size: 120, weight: .bold))
                .foregroundStyle(.elephantLight)
                .rotationEffect(.degrees(15), anchor: .topTrailing)
                .offset(x: -190, y: 10)
            // 頭
            Image(systemName: "button.angledtop.vertical.left.fill")
                .resizable()
                .rotationEffect(.degrees(90))
                .frame(width: 160, height: 200)
                .foregroundStyle(.elephantLight)
                .offset(x: 140, y: -40)
            // 鼻
//            Text("つ")
//                .font(.system(size: 120, weight: .black))
//                .foregroundStyle(.elephantLight)
//                .rotationEffect(.degrees(15), anchor: .topLeading)
//                .offset(x: 280, y: 40)
            // 目
            Circle()
                .foregroundStyle(.elephantEye)
                .frame(width: 20, height: 20)
                .offset(x: 160, y: -60)
            // 牙
            Image(systemName: "moon.fill")
                .resizable()
                .rotationEffect(.degrees(-30))
                .frame(width: 80, height: 80)
                .foregroundStyle(.elephantFang)
                .offset(x: 180, y: 30)
            // 鞍
            Image(systemName: "crown.fill")
                .resizable()
                .rotationEffect(.degrees(165))
                .frame(width: 160, height: 140)
                .foregroundStyle(.elephantSaddle)
                .offset(x: -50, y: -30)
            // 耳
            Image(systemName: "button.angledtop.vertical.right.fill")
                .resizable()
                .frame(width: 100, height: 140)
                .foregroundStyle(.elephantDark)
                .rotationEffect(.degrees(180))
                .offset(x: 50, y: -40)
        }
    }
}
