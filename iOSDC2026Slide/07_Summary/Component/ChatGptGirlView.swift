//
//  ChatGptGirlView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct ChatGptGirlView: View {
    var body: some View {
        ZStack {
            // Hair
            Circle()
                .fill(Color.brown.opacity(0.95))
                .frame(width: 250, height: 250)
                .offset(y: -20)

            // Face
            Circle()
                .fill(Color(red: 1.0, green: 0.88, blue: 0.82))
                .frame(width: 190, height: 180)
                .offset(y: 15)

            // Ears
            HStack(spacing: 172) {
                Circle()
                    .fill(Color(red: 1.0, green: 0.82, blue: 0.75))
                    .frame(width: 30, height: 48)

                Circle()
                    .fill(Color(red: 1.0, green: 0.82, blue: 0.75))
                    .frame(width: 30, height: 48)
            }
            .offset(y: 15)

            // Bangs
            HStack(spacing: -8) {
                ForEach(0..<5, id: \.self) { i in
                    Capsule()
                        .fill(Color.brown.opacity(0.95))
                        .frame(width: 42, height: 75)
                        .rotationEffect(.degrees(Double(i - 2) * 10))
                        .offset(y: CGFloat(abs(i - 2)) * 4)
                }
            }
            .offset(y: -82)

            // Eyes
            HStack(spacing: 58) {
                SparkleEye()
                SparkleEye()
            }
            .offset(y: 15)

            // Blush
            HStack(spacing: 88) {
                Blush()
                Blush()
            }
            .offset(y: 55)

            // Nose
            Circle()
                .fill(Color.orange.opacity(0.35))
                .frame(width: 7, height: 7)
                .offset(y: 43)

            // Mouth
            Image(systemName: "mouth.fill")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(.pink)
                .offset(y: 72)

            // Hair bow
            HStack(spacing: -5) {
                Image(systemName: "triangle.fill")
                    .font(.system(size: 27))
                    .foregroundStyle(.pink.opacity(0.8))
                    .rotationEffect(.degrees(-35))

                Circle()
                    .fill(.pink)
                    .frame(width: 15)

                Image(systemName: "triangle.fill")
                    .font(.system(size: 27))
                    .foregroundStyle(.pink.opacity(0.8))
                    .rotationEffect(.degrees(35))
            }
            .offset(x: 82, y: -85)
        }
        .frame(width: 280, height: 280)
    }

    struct SparkleEye: View {
        var body: some View {
            ZStack {
                // White eye
                Ellipse()
                    .fill(.white)
                    .frame(width: 48, height: 62)

                // Iris
                Ellipse()
                    .fill(Color.brown)
                    .frame(width: 38, height: 54)

                // Big highlight
                Circle()
                    .fill(.white)
                    .frame(width: 13)
                    .offset(x: -7, y: -13)

                // Small sparkle
                Image(systemName: "sparkle")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.white)
                    .offset(x: 6, y: 8)

                // Eyelashes
                Image(systemName: "eyebrow")
                    .font(.system(size: 31, weight: .bold))
                    .foregroundStyle(Color.brown)
                    .offset(y: -34)
            }
        }
    }

    struct Blush: View {
        var body: some View {
            Capsule()
                .fill(.pink.opacity(0.22))
                .frame(width: 42, height: 22)
                .overlay {
                    HStack(spacing: 5) {
                        ForEach(0..<3, id: \.self) { _ in
                            Capsule()
                                .fill(.pink.opacity(0.3))
                                .frame(width: 3, height: 12)
                                .rotationEffect(.degrees(20))
                        }
                    }
                }
        }
    }
}
