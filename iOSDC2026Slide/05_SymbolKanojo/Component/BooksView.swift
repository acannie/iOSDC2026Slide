//
//  BooksView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/09/08.
//

import SwiftUI

struct BooksView: View {
    var body: some View {
        ZStack(alignment: .center) {
            book1
                .offset(x: -72, y: 10)
            book2
                .offset(x: -20, y: 25)
            book5
                .offset(x: 35, y: 10)
            book3
                .offset(x: 80, y: 0)
            book4
                .offset(x: 135, y: 10)
        }
        .frame(height: 190)
    }
}

private extension BooksView {
    var book1: some View {
        var star: some View {
            ZStack {
                Rectangle()
                    .stroke(.bookGold, lineWidth: 2)
                    .fill(.clear)
                    .frame(width: 10, height: 10)
                Rectangle()
                    .stroke(.bookGold, lineWidth: 2)
                    .fill(.clear)
                    .frame(width: 10, height: 10)
                    .rotationEffect(.degrees(45))
            }
        }
        var line: some View {
            Rectangle()
                .fill(.bookGold)
                .frame(width: 2, height: 30)
        }
        return HStack(spacing: 8) {
            line
                .padding(.leading, 5)
            star
            line
            Text("Swift 6")
                .font(.system(size: 24, weight: .regular, design: .serif))
                .foregroundStyle(.bookGold)
                .scaleEffect(y: 0.5)
            HStack(spacing: 4){
                line
                line
            }
            star
            line
                .padding(.trailing, 5)
        }
        .frame(width: 170, height: 40)
        .background(
            Rectangle()
                .fill(.bookBlue)
        )
        .rotationEffect(.degrees(90))
    }

    var book2: some View {
        var line: some View {
            Rectangle()
                .fill(.bookGold)
                .frame(width: 2, height: 50)
        }
        return HStack(spacing: 8) {
            line
                .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 4) {
                Text("HIG")
                    .font(.system(size: 12, weight: .bold, design: .serif))
                    .foregroundStyle(.bookGold)
                Text("Human Interface Guidelines")
                    .font(.system(size: 8, weight: .regular, design: .serif))
                    .foregroundStyle(.bookGold)
            }
            HStack(spacing: 4) {
                line
                line
            }
            Spacer(minLength: 0)
        }
        .frame(width: 140, height: 60)
        .background(
            Rectangle()
                .fill(.bookBrown)
        )
        .rotationEffect(.degrees(90))
    }

    var book3: some View {
        HStack(spacing: 8) {
            Text("SF Symbols")
                .font(.system(size: 16, weight: .regular, design: .serif))
                .foregroundStyle(.bookGold)
                .padding(.leading, 16)
            Spacer(minLength: 0)
        }
        .frame(width: 190, height: 30)
        .background(
            Rectangle()
                .fill(.bookGreen)
        )
        .rotationEffect(.degrees(95))
    }

    var book4: some View {
        var star: some View {
            ZStack {
                Rectangle()
                    .stroke(.bookGold, lineWidth: 2)
                    .fill(.clear)
                    .frame(width: 10, height: 10)
                Rectangle()
                    .stroke(.bookGold, lineWidth: 2)
                    .fill(.clear)
                    .frame(width: 10, height: 10)
                    .rotationEffect(.degrees(45))
            }
        }
        var line: some View {
            Rectangle()
                .fill(.bookGold)
                .frame(width: 2, height: 30)
        }
        return HStack(spacing: 8) {
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.bookGold)
                    .frame(width: 3, height: 30)
                Image(systemName: "house.lodge.fill")
                    .resizable()
                    .foregroundStyle(.bookGold)
                    .frame(width: 30, height: 10)
                    .rotationEffect(.degrees(90))
            }
            Text("UIKit")
                .font(.system(size: 8, weight: .bold, design: .serif))
                .foregroundStyle(.bookGold)
            HStack(spacing: 4) {
                line
                line
            }
            Text("SwiftUI")
                .font(.system(size: 12, weight: .bold, design: .serif))
                .foregroundStyle(.bookGold)
            HStack(spacing: 4) {
                Image(systemName: "house.lodge.fill")
                    .resizable()
                    .foregroundStyle(.bookGold)
                    .frame(width: 30, height: 10)
                    .rotationEffect(.degrees(-90))
                Rectangle()
                    .fill(.bookGold)
                    .frame(width: 3, height: 30)
            }
        }
        .frame(width: 170, height: 40)
        .background(
            Rectangle()
                .fill(.bookRed)
        )
        .rotationEffect(.degrees(80))
    }

    var book5: some View {
        var wave: some View {
            Image(systemName: "lines.measurement.horizontal")
                .resizable()
                .foregroundStyle(.bookGold)
                .frame(width: 10, height: 30)
        }
        var line: some View {
            Rectangle()
                .fill(.bookGold)
                .frame(width: 4, height: 40)
        }
        return HStack(spacing: 8) {
            line
                .padding(.leading, 4)
            wave
            VStack(alignment: .leading, spacing: 0) {
                Text("Hello World")
                    .font(.system(size: 12, weight: .bold, design: .serif))
                    .foregroundStyle(.bookGold)
                Text("why do people greet the world")
                    .font(.system(size: 6, weight: .regular, design: .serif))
                    .foregroundStyle(.bookGold)
            }
            .padding(.leading, 5)
            Spacer()
            HStack(spacing: 4) {
                wave
                wave
            }
            line
                .padding(.trailing, 4)
        }
        .frame(width: 170, height: 40)
        .background(
            Rectangle()
                .fill(.bookOlive)
        )
        .rotationEffect(.degrees(90))
    }
}
