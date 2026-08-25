//
//  SeoulDecorationView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

struct SeoulDecorationView: View {
    static let identifierCity = City.seoul
    @Binding var city: City?

    @State private var areNeonsVisible = false

    init(city: Binding<City?>) {
        self._city = city
    }

    var body: some View {
        ZStack {
            NeonView()
                .opacity(areNeonsVisible ? 1 : 0)
            SeoulTowerView()
                .offset(x: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            ForEach(Side.allCases, id: \.self) { side in
                TownView(side: side)
                    .offset(x: city == Self.identifierCity ? 0 : side.unit * 300)
                    .animation(.bouncy, value: city)
            }
            RoadView()
                .offset(y: city == Self.identifierCity ? 0 : 300)
                .animation(.bouncy, value: city)
        }
        .onAppear {
            updateNeonVisibility(city: city)
        }
        .onChange(of: city) {
            updateNeonVisibility(city: city)
        }
    }
}

private extension SeoulDecorationView {
    func updateNeonVisibility(city: City?) {
        if city == Self.identifierCity {
            withAnimation(.bouncy(duration: 2.0) .delay(0.5)) {
                areNeonsVisible = true
            }
        } else {
            withAnimation(.bouncy) {
                areNeonsVisible = false
            }
        }
    }
}
