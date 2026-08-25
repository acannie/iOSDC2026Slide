//
//  TaipeiDecorationView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

struct TaipeiDecorationView: View {
    static let identifierCity = City.taipei
    @Binding var city: City?

    init(city: Binding<City?>) {
        self._city = city
    }

    var body: some View {
        ZStack {
            FenceView()
                .offset(y: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            FireworksView()
                .opacity(city == Self.identifierCity ? 1 : 0)
                .animation(.easeInOut, value: city)
            LanternsView()
                .offset(y: city == Self.identifierCity ? 0 : -300)
                .animation(.bouncy, value: city)
            TapiocaMilkTeaView()
                .offset(x: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            XiaolongbaosView()
                .offset(x: city == Self.identifierCity ? 0 : -200)
                .animation(.bouncy, value: city)
        }
    }
}
