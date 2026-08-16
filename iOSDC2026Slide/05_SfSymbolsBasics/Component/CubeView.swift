//
//  CubeView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/16.
//

import SwiftUI

struct CubeView: View {
    @State private var count: Int = 0
    let perspective = 0.5
    let vertexLength: CGFloat = 300

    var body: some View {
        ZStack {
            ForEach(Face.allCases, id:\.self) { face in
                Rectangle()
                    .foregroundStyle(face.color.opacity(0.8))
                    .frame(width: vertexLength, height: vertexLength)
                    .rotation3DEffect(
                        .degrees(degrees(of: face)),
                        axis: (0, 1, 0),
                        anchorZ: -vertexLength / 2,
                        perspective: perspective
                    )
                    .zIndex(rank(of: face))
                    .animation(.linear(duration: 1.0), value: count)
            }
        }
        .frame(width: 450, height: 460)
        .task {
            while true {
                try? await Task.sleep(for: .seconds(0.1))
                count += 1
            }
        }
    }

    enum Face: Int, CaseIterable {
        case red
        case yellow
        case green
        case blue

        var angle: Double {
            Double(rawValue) * 90
        }

        var color: Color {
            switch self {
            case .red: .red
            case .yellow: .yellow
            case .green: .green
            case .blue: .blue
            }
        }
    }

    func normalized(_ degrees: Double) -> Double {
        Double(Int(degrees) % 360)
    }

    func degrees(of square: Face) -> Double {
        CGFloat(count) * 10 + square.angle
    }

    func rank(of face: Face) -> Double {
        let sortedfaces = Face.allCases.sorted { s1, s2 in
            let rad1 = degrees(of: s1) * .pi / 180
            let rad2 = degrees(of: s2) * .pi / 180
            return cos(rad1) < cos(rad2)
        }
        if let index = sortedfaces.firstIndex(of: face) {
            return Double(index)
        }
        return 0
    }
}
