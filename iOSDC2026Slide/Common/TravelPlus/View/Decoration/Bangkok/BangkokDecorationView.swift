//
//  BangkokDecorationView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

struct BangkokDecorationView: View {
    static let identifierCity = City.bangkok
    @Binding var city: City?

    init(city: Binding<City?>) {
        self._city = city
    }

    var body: some View {
        ZStack {
            SunAndCloudView()
                .opacity(city == Self.identifierCity ? 1 : 0)
                .animation(.easeInOut, value: city)
            SaoChingchaView()
                .offset(x: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            TempleView()
                .offset(y: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            ElephantView()
                .offset(x: city == Self.identifierCity ? 0 : -300)
                .animation(.bouncy, value: city)
            PalmTreeView()
                .offset(x: city == Self.identifierCity ? 0 : 200)
                .animation(.bouncy, value: city)
            LeavesView()
                .offset(
                    x: city == Self.identifierCity ? 0 : 200,
                    y: city == Self.identifierCity ? 0 : -200
                )
                .animation(.bouncy, value: city)
        }
    }
}
