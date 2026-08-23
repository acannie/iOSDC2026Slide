//
//  01_Question.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/24.
//

import SwiftUI

struct Question: View {
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                bubbleProblem
                    .padding(64)
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    smile
                    Spacer()
                }
                textQuestion
            }
            .padding(64)
            VStack {
                Spacer()
                HStack(spacing: 32) {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 20) {
                        arrow
                        bubbleSuggestion
                    }
                }
            }
            .padding(64)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.questionGreen)
    }
}

private extension Question {
    var bubbleProblem: some View {
        ZStack {
            Ellipse()
                .fill(
                    LinearGradient(
                        colors: [.questionRed, .questionYellow, .questionGreen, .blue],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .stroke(.black, lineWidth: 10)
                .frame(maxWidth: .infinity)
                .frame(height: 300)
            Text("イラストやアイコンが用意で\nきなくて開発が進まない……")
                .multilineTextAlignment(.center)
                .italic()
                .font(.system(size: 70, weight: .heavy, design: .rounded))
            Group {
                Ellipse()
                    .fill(
                        LinearGradient(
                            colors: [.questionRed, .questionYellow, .questionGreen, .blue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .stroke(.black, lineWidth: 10)
                    .frame(width: 100, height: 30)
                    .offset(x: -300, y: 300)
                Ellipse()
                    .fill(
                        LinearGradient(
                            colors: [.questionRed, .questionYellow, .questionGreen, .blue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .stroke(.black, lineWidth: 10)
                    .frame(width: 200, height: 60)
                    .offset(x: -100, y: 250)
            }
        }
//        .shadow(color: .black, radius: 8, x: 4, y: 4)
    }

    var smile: some View {
        Image(systemName: "face.smiling")
            .resizable()
            .frame(width: 100, height: 300)
            .foregroundStyle(.blue)
    }

    var textQuestion: some View {
        Text("そ　ん　な　経　験\nあ　り　ま　せ　ん　か")
            .foregroundStyle(.questionMagenta)
            .font(Font.system(size: 40, weight: .semibold))
    }

    var arrow: some View {
        ZStack {
            Image(systemName: "arrowshape.turn.up.right.fill")
                .resizable()
                .foregroundStyle(.questionWhite)
            Image(systemName: "arrowshape.turn.up.right")
                .resizable()
                .foregroundStyle(.questionRed)
        }
        .frame(width: 200, height: 80)
        .rotationEffect(.degrees(90))
    }

    var bubbleSuggestion: some View {
        var triangle: some View {
            ZStack {
                Image(systemName: "triangleshape.fill")
                    .resizable()
                    .foregroundStyle(.questionYellow)
                Image(systemName: "triangleshape")
                    .resizable()
                    .fontWeight(.heavy)
                    .foregroundStyle(.questionRed)
            }
            .frame(width: 80, height: 140)
        }
        return ZStack {
            ZStack {
                Group {
                    ForEach(0..<12) { i in
                        triangle
                            .offset(y: -70)
                            .rotationEffect(.degrees(CGFloat(i * 30)), anchor: .bottom)
                    }
                }
                .offset(y: -70)
                Circle()
                    .fill(.questionYellow)
                    .frame(width: 330, height: 230)
            }
            .scaleEffect(x: 1.5)
            Text("そこで\n提案です！")
                .font(.system(size: 60, weight: .heavy))
                .foregroundStyle(.questionRed)
        }
        .frame(width: 620, height: 420)
    }
}
