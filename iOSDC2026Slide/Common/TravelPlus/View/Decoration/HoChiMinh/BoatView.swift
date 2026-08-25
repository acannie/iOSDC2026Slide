//
//  BoatView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/30.
//

import SwiftUI

struct BoatView: View {
    private let colorDark = Color("hoChiMinh_boat_dark")
    private let colorLight = Color("hoChiMinh_boat_light")

    var body: some View {
        ZStack  {
            // 船本体
            ZStack {
                Ellipse()
                    .foregroundStyle(colorLight)
                Ellipse()
                    .stroke(colorDark, lineWidth: 30)
            }
            .frame(width: 500, height: 200)
            .rotationEffect(.degrees(-65))
            .offset(x: 100, y: 480)
        }
    }
}
