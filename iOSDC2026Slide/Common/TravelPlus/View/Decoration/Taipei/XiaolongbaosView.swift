//
//  XiaolongbaosView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct XiaolongbaosView: View {
    private let xiaolongbaoColorLight = Color("taipei_xiaolongbao_main_light")
    private let xiaolongbaoColorDark = Color("taipei_xiaolongbao_main_dark")
    private let steamerColorLight = Color("taipei_xiaolongbao_steamer_light")
    private let steamerColorDark = Color("taipei_xiaolongbao_steamer_dark")
    private let steamColor = Color("taipei_xiaolongbao_steam")

    var body: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 180, height: 60)
                .foregroundStyle(steamerColorDark)
                .offset(y: -40)
            Image(systemName: "cylinder.fill")
                .resizable()
                .frame(width: 200, height: 150)
                .foregroundStyle(steamerColorDark)
            xiaolongbao
                .offset(x: -40, y: -30)
            xiaolongbao
                .offset(x: 40, y: -30)
            Image(systemName: "cylinder.split.1x2.fill")
                .resizable()
                .frame(width: 200, height: 150)
                .foregroundStyle(steamerColorLight)
            xiaolongbao
                .offset(x: 0, y: -60)
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 80, height: 50)
                .foregroundStyle(steamColor)
                .symbolEffect(.breathe)
                .offset(x: -50, y: -90)
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 60, height: 40)
                .foregroundStyle(steamColor)
                .symbolEffect(.breathe)
                .offset(x: 10, y: -120)
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 80, height: 50)
                .foregroundStyle(steamColor)
                .symbolEffect(.breathe)
                .offset(x: 50, y: -100)
        }
        .rotationEffect(.degrees(15))
        .offset(x: -120, y: 350)
    }
}

private extension XiaolongbaosView {
    var xiaolongbao: some View {
        ZStack {
            Image(systemName: "drop.fill")
                .resizable()
                .fontWeight(.light)
                .foregroundStyle(xiaolongbaoColorLight)
                .frame(width: 60, height: 60)
            Image(systemName: "lines.measurement.horizontal")
                .resizable()
                .foregroundStyle(xiaolongbaoColorDark)
                .frame(width: 20, height: 20)
                .offset(y: -10)
        }
    }
}
