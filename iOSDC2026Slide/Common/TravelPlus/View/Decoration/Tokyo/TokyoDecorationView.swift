//
//  TokyoDecorationView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

struct TokyoDecorationView: View {
    static let identifierCity = City.tokyo
    @Binding var city: City?

    init(city: Binding<City?>) {
        self._city = city
    }

    var body: some View {
        ZStack {
            CloudsView()
                .opacity(city == Self.identifierCity ? 1 : 0)
                .animation(.easeInOut, value: city)
            SakuraLeftView()
                .offset(x: city == Self.identifierCity ? 0 : -200)
                .animation(.bouncy, value: city)
            SakuraRightView()
                .offset(x: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            MtFujiView()
                .offset(y: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            SakuraConfettiView(city: $city)
                .opacity(city == Self.identifierCity ? 1 : 0)
                .animation(.easeInOut, value: city)
            TokyoTowerView()
                .offset(x: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            FlowersView()
                .offset(y: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
        }
    }
}
