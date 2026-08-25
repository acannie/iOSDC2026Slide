//
//  SakuraRightView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct SakuraRightView: View {
    private let sakuraColorDark = Color("tokyo_sakura_dark")
    private let sakuraColorLight = Color("tokyo_sakura_light")
    private let sakuraColorMiddle = Color("tokyo_sakura_middle")

    var body: some View {
        ZStack {
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 250, height: 150)
                .offset(x: 170, y: -400)
                .foregroundStyle(sakuraColorMiddle)
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 250, height: 150)
                .rotationEffect(.degrees(180))
                .offset(x: 170, y: -300)
                .foregroundStyle(sakuraColorMiddle)
            SakuraFlowerView(color: sakuraColorLight)
                .offset(x: 100, y: -300)
            SakuraFlowerView(color: sakuraColorLight)
                .offset(x: 150, y: -270)
            SakuraFlowerView(color: sakuraColorLight)
                .offset(x: 90, y: -350)
            SakuraFlowerView(color: sakuraColorLight)
                .offset(x: 160, y: -320)
            SakuraFlowerView(color: sakuraColorLight)
                .offset(x: 120, y: -370)
            SakuraTreeView()
                .rotationEffect(.degrees(-30))
                .offset(x: 190, y: -270)
        }
    }
}
