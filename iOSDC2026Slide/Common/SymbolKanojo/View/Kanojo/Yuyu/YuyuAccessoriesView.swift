//
//  YuyuAccessoriesView.swift
//  SymbolKanojo
//
//  Created by SASAOKA Akane on 2025/05/01.
//

import SwiftUI

struct YuyuAccessoriesView: AccessoriesView {
    @ObservedObject private var vm: YuyuAccessoriesViewModel

    @State private(set) var isPiropiroStickAnimated = false

    private let monocleEdgeColor = Color("monocle_edge")
    private let monocleLensColor = Color("monocle_lens")
    private let glassesEdgeColor = Color("glasses_edge")
    private let glassesLensColor = Color("glasses_lens")
    private let sunglassesEdgeColor = Color("sunglasses_edge")
    private let sunglassesLensColor = Color("sunglasses_lens")
    private let partyHatColorLight = Color("partyHat_light")
    private let partyHatColorDark = Color("partyHat_dark")
    private let piropiroStickColor = Color("piropiroStick")
    private let bandageColorLight = Color("bandage_light")
    private let bandageColorDark = Color("bandage_dark")
    private let hatColorLight = Color("hat_light")
    private let hatColorDark = Color("hat_dark")
    private let thermometerGlassColor = Color("thermometerGlass")
    private let thermometerLiquidColor = Color("thermometerLiquid")

    init(vm: YuyuAccessoriesViewModel) {
        self.vm = vm
    }

    var body: some View {
        ZStack {
            monocle
                .opacity(vm.accessoriesType == .monocle ? 1.0 : 0.0)
            glasses
                .opacity(vm.accessoriesType == .glasses ? 1.0 : 0.0)
            sunglasses
                .opacity(vm.accessoriesType == .sunglasses ? 1.0 : 0.0)
            party
                .opacity(vm.accessoriesType == .party ? 1.0 : 0.0)
            injury
                .opacity(vm.accessoriesType == .injury ? 1.0 : 0.0)
            hat
                .opacity(vm.accessoriesType == .hat ? 1.0 : 0.0)
            thermometer
                .opacity(vm.accessoriesType == .thermometer ? 1.0 : 0.0)
        }
    }
}

private extension YuyuAccessoriesView {
    var monocle: some View {
        ZStack {
            Image(systemName: "moonphase.full.moon")
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(monocleEdgeColor, monocleLensColor)
                .frame(width: 110, height: 110)
            Image(systemName: "suspension.shock")
                .resizable()
                .foregroundStyle(monocleEdgeColor)
                .frame(width: 10, height: 100)
                .offset(x: 60, y: 30)
        }
        .offset(x: 75, y: -50)
    }

    var glasses: some View {
        Image(systemName: "sunglasses")
            .resizable()
            .symbolRenderingMode(.palette)
            .foregroundStyle(glassesEdgeColor, glassesLensColor)
            .frame(width: 300, height: 100)
            .offset(y: -50)
    }

    var sunglasses: some View {
        Image(systemName: "sunglasses")
            .resizable()
            .symbolRenderingMode(.palette)
            .foregroundStyle(sunglassesEdgeColor, sunglassesLensColor)
            .frame(width: 300, height: 100)
            .offset(y: -50)
    }

    var party: some View {
        var piropiroStickHeight: CGFloat {
            isPiropiroStickAnimated ? 100.0 : 15.0
        }
        var piropiroStickOffsetY: CGFloat {
            piropiroStickHeight / 2
        }
        return ZStack {
            // パーティー帽
            Image(systemName: "cone.fill")
                .resizable()
                .foregroundStyle(
//                    .angularGradient(
//                        Gradient(colors: [partyHatColorLight, partyHatColorDark]),
//                        center: .top,
//                        startAngle: .degrees(0),
//                        endAngle: .degrees(180)
//                    )
                    partyHatColorDark
                )
                .aspectRatio(contentMode: .fit)
                .frame(height: 120)
                .offset(x: 0, y: -280)
            // ピロピロ棒
            ZStack {
                Image(systemName: "poweron")
                    .resizable()
                    .foregroundStyle(piropiroStickColor)
                    .frame(width: 10, height: piropiroStickHeight)
                    .offset(x: 1, y: 25 + piropiroStickOffsetY)
                Image(systemName: "internaldrive.fill")
                    .resizable()
                    .rotationEffect(.degrees(180))
                    .foregroundStyle(piropiroStickColor)
                    .frame(width: 30, height: 20)
                    .offset(x: 0, y: 25 + piropiroStickHeight)
            }
            .animation(.easeOut(duration: 1.0).repeatForever(autoreverses: true), value: isPiropiroStickAnimated)
            .onAppear {
                isPiropiroStickAnimated = true
            }
        }
    }

    var injury: some View {
        ZStack {
            Image(systemName: "cross.fill")
                .resizable()
                .foregroundStyle(bandageColorLight)
            Image(systemName: "cross")
                .resizable()
                .fontWeight(.thin)
                .foregroundStyle(bandageColorDark)
        }
        .rotationEffect(.degrees(30))
        .aspectRatio(contentMode: .fit)
        .frame(width: 100)
        .offset(x: -50, y: -160)
        .ios18Animation(.bounce)
    }

    var hat: some View {
        ZStack {
            Image(systemName: "hat.widebrim.fill")
                .resizable()
                .foregroundStyle(hatColorLight)
            Image(systemName: "hat.widebrim")
                .resizable()
                .fontWeight(.thin)
                .foregroundStyle(hatColorDark)
                .offset(y: -3)
        }
        .frame(width: 500, height: 200)
        .offset(y: -200)
    }

    var thermometer: some View {
        Image(systemName: "thermometer.variable")
            .resizable()
            .rotationEffect(.degrees(225))
            .symbolRenderingMode(.palette)
            .foregroundStyle(thermometerLiquidColor, thermometerGlassColor)
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .offset(x: 25, y: 15)
    }
}

#Preview {
    YuyuAccessoriesView(vm: .init())
}
