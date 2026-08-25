//
//  HoChiMinhDecorationView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

struct HoChiMinhDecorationView: View {
    static let identifierCity = City.hoChiMinh
    @Binding var city: City?

    init(city: Binding<City?>) {
        self._city = city
    }

    var body: some View {
        ZStack {
            GrassView()
                .offset(x: city == Self.identifierCity ? 0 : -200)
                .animation(.bouncy, value: city)
            MoonView()
                .opacity(city == Self.identifierCity ? 1 : 0)
                .animation(.easeInOut, value: city)
            LakeView()
                .offset(y: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            BoatView()
                .offset(x: city == Self.identifierCity ? 0 : 400)
                .animation(.bouncy, value: city)
            WomanView()
                .offset(x: city == Self.identifierCity ? 0 : 400)
                .animation(.bouncy, value: city)
        }
    }
}
