//
//  RoadView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

import SwiftUI

struct RoadView: View {
    private let roadwhite = Color("seoul_road_white")
    private let roadGray = Color("seoul_road_gray")
    private let carColor = Color("seoul_car_main")
    private let carLightColor = Color("seoul_car_light")
    private let buildingColor = Color("seoul_building_main")
    private let buildingWindowColor = Color("seoul_building_window")

    var body: some View {
        ZStack {
            road
            car
            light
        }
    }
}

private extension RoadView {
    var road: some View {
        ZStack {
            Image(systemName: "arrowtriangle.backward.fill")
                .resizable()
                .foregroundStyle(roadGray)
                .frame(width: 80, height: 200)
                .offset(x: -130, y: 50)
            Image(systemName: "arrowtriangle.forward.fill")
                .resizable()
                .foregroundStyle(roadGray)
                .frame(width: 80, height: 200)
                .offset(x: 130, y: 50)
            Rectangle()
                .fill(roadGray)
                .frame(width: 200, height: 100)
            Image(systemName: "road.lanes")
                .resizable()
                .fontWeight(.ultraLight)
                .foregroundStyle(roadwhite)
                .frame(width: UIScreen.main.bounds.width, height: 100)
        }
        .offset(y: 400)
    }

    var car: some View {
        ZStack {
            Image(systemName: "car.rear")
                .resizable()
                .foregroundStyle(buildingColor)
            Image(systemName: "car.rear.fill")
                .resizable()
                .foregroundStyle(carColor)
            ForEach(Side.allCases, id: \.self) { side in
                Image(systemName: "capsule.portrait.fill")
                    .resizable()
                    .foregroundStyle(carLightColor)
                    .frame(width: 10, height: 15)
                    .shadow(color: carLightColor, radius: 4)
                    .offset(x: side.unit * 26, y: 2)
            }
        }
        .frame(width: 80, height: 60)
        .symbolEffect(.wiggle)
        .offset(x: -50, y: 340)
    }

    var light: some View {
        ForEach(Side.allCases, id: \.self) {side in
            ZStack {
                ForEach(0..<10) { _ in
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundStyle(buildingWindowColor)
                        .scaledToFit()
                        .frame(width: CGFloat.random(in: 10...30))
                        .offset(
                            x: CGFloat.random(in: side.isLeft ? (-200)...(-100) : 100...200),
                            y: CGFloat.random(in: 200...400)
                        )
                        .symbolEffect(.breathe)
                }
            }
        }
    }
}
