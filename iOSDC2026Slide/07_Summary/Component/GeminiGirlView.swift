//
//  GeminiGirlView.swift
//  iOSDC2026Slide
//
//  Created by SASAOKA Akane on 2026/08/25.
//

import SwiftUI

struct GeminiGirlView: View {
    var body: some View {
        // キャラクター本体のコンテナ
        ZStack {
            // 1. 後ろ髪 (後ろ側の髪パーツ)
            BackHairView()
            
            // 2. 輪郭・顔のベース
            FaceBaseView()
            
            // 3. 瞳・眉毛・口（パーツ群）
            FacialFeaturesView()
            
            // 4. 前髪・横髪
            FrontHairView()
            
            // 5. 髪飾り（リボンやハート）
            HairAccessoriesView()
        }
        .frame(width: 320, height: 380)
    }
    
    // MARK: - 1. 後ろ髪 (SF Symbols & Shape)
    private struct BackHairView: View {
        var body: some View {
            ZStack {
                // ふんわり広がるロングヘア (Shape & SF Symbol の組み合わせ)
                Capsule()
                    .fill(LinearGradient(colors: [.pink, .purple.opacity(0.7)], startPoint: .top, endPoint: .bottom))
                    .frame(width: 260, height: 280)
                    .offset(y: 30)
                
                // 髪の毛先の束感を SF Symbol (leaf.fill / flame.fill) で見立てる
                Image(systemName: "flame.fill")
                    .resizable()
                    .font(.system(size: 100, weight: .bold))
                    .foregroundStyle(LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom))
                    .rotationEffect(.degrees(180))
                    .scaleEffect(x: 1.8, y: 1.5)
                    .offset(y: 100)
            }
        }
    }

    // MARK: - 2. 輪郭・肌
    private struct FaceBaseView: View {
        var body: some View {
            ZStack {
                // 顔のベース（下顎に向かって少しキュッとした形状）
                Circle()
                    .fill(Color(red: 1.0, green: 0.94, blue: 0.91))
                    .frame(width: 190, height: 200)
                    .scaleEffect(x: 0.95, y: 1.05)
                
                // ほっぺのチーク (薄ピンクのフェード Circle)
                HStack(spacing: 90) {
                    Circle()
                        .fill(Color.pink.opacity(0.35))
                        .frame(width: 36, height: 20)
                        .blur(radius: 4)
                    Circle()
                        .fill(Color.pink.opacity(0.35))
                        .frame(width: 36, height: 20)
                        .blur(radius: 4)
                }
                .offset(y: 20)
            }
        }
    }

    // MARK: - 3. 顔のパーツ（目・鼻・口・まゆげ）
    private struct FacialFeaturesView: View {
        var body: some View {
            ZStack {
                // --- 眉毛 (ひらがなの「つ」または SF Symbol "minus" の曲線活用) ---
                HStack(spacing: 65) {
                    Text("つ")
                        .font(.system(size: 32, weight: .medium, design: .rounded))
                        .foregroundStyle(Color.purple.opacity(0.8))
                        .rotationEffect(.degrees(-160))
                        .scaleEffect(x: 1.2, y: 0.6)
                    
                    Text("つ")
                        .font(.system(size: 32, weight: .medium, design: .rounded))
                        .foregroundStyle(Color.purple.opacity(0.8))
                        .rotationEffect(.degrees(-20))
                        .scaleEffect(x: -1.2, y: 0.6)
                }
                .offset(y: -42)

                // --- 瞳（左右） ---
                HStack(spacing: 50) {
                    AnimeEyeView()
                    AnimeEyeView()
                        .scaleEffect(x: -1, y: 1) // 左右反転
                }
                .offset(y: -5)

                // --- 鼻 (極小の三角形/ドット) ---
                Image(systemName: "triangle.fill")
                    .resizable()
                    .frame(width: 5, height: 4)
                    .foregroundStyle(Color.pink.opacity(0.5))
                    .rotationEffect(.degrees(180))
                    .offset(y: 28)

                // --- 口 (アーチ形状または「っ」のテキスト活用) ---
                ZStack {
                    // 開いた可愛い口
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 16, height: 14)
                        .foregroundStyle(Color.red.opacity(0.75))
                        .rotationEffect(.degrees(180))
                        .offset(y: 45)
                }
            }
        }
    }

    // MARK: - 瞳の詳細コンポーネント (重ね合わせ技)
    private struct AnimeEyeView: View {
        var body: some View {
            ZStack {
                // まつ毛上部 (太めの曲線シンボル / "capsule" + SF Symbol)
                Image(systemName: "moon.fill")
                    .resizable()
                    .frame(width: 44, height: 28)
                    .foregroundStyle(Color(red: 0.2, green: 0.1, blue: 0.2))
                    .rotationEffect(.degrees(-130))
                    .offset(y: -22)
                
                // 瞳のベース白目
                Capsule()
                    .fill(Color.white)
                    .frame(width: 38, height: 48)
                    .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 2)

                // 虹彩 (グラデーション)
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [Color.purple, Color.pink, Color.blue.opacity(0.8)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 30, height: 42)

                // 瞳孔
                Circle()
                    .fill(Color(red: 0.15, green: 0.05, blue: 0.2))
                    .frame(width: 14, height: 18)
                    .offset(y: 2)

                // メインハイライト (大)
                Circle()
                    .fill(Color.white)
                    .frame(width: 11, height: 11)
                    .offset(x: -6, y: -10)

                // サブハイライト (小)
                Circle()
                    .fill(Color.white.opacity(0.9))
                    .frame(width: 6, height: 6)
                    .offset(x: 6, y: 8)
                
                // キラキラ感（星のシンボル）
                Image(systemName: "star.fill")
                    .font(.system(size: 7))
                    .foregroundStyle(Color.yellow.opacity(0.8))
                    .offset(x: -3, y: 12)
            }
        }
    }

    // MARK: - 4. 前髪 (ひらがなフォント & Shape の解釈)
    private struct FrontHairView: View {
        var body: some View {
            ZStack {
                // 中央前髪（束感）
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 36, height: 75)
                    .foregroundStyle(LinearGradient(colors: [.pink, .purple.opacity(0.9)], startPoint: .top, endPoint: .bottom))
                    .rotationEffect(.degrees(180))
                    .offset(x: -5, y: -80)

                // サイド前髪（左）
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 32, height: 85)
                    .foregroundStyle(Color.pink)
                    .rotationEffect(.degrees(160))
                    .offset(x: -45, y: -70)

                // サイド前髪（右）
                Image(systemName: "drop.fill")
                    .resizable()
                    .frame(width: 32, height: 85)
                    .foregroundStyle(Color.pink)
                    .rotationEffect(.degrees(200))
                    .offset(x: 35, y: -70)

                // 触覚・横の姫カットパーツ (SF Font ひらがな「し」を髪のカーブに立てる)
                Text("し")
                    .font(.system(size: 110, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.pink)
                    .scaleEffect(x: -0.6, y: 1.1)
                    .rotationEffect(.degrees(15))
                    .offset(x: -85, y: -10)

                Text("し")
                    .font(.system(size: 110, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.pink)
                    .scaleEffect(x: 0.6, y: 1.1)
                    .rotationEffect(.degrees(-15))
                    .offset(x: 75, y: -10)
                
                // 髪のツヤ（天使の輪っかハイライト）
                Ellipse()
                    .stroke(Color.white.opacity(0.6), lineWidth: 4)
                    .frame(width: 140, height: 15)
                    .blur(radius: 1)
                    .offset(y: -95)
            }
        }
    }

    // MARK: - 5. 髪飾りアクセサリ
    private struct HairAccessoriesView: View {
        var body: some View {
            ZStack {
                // サイドに配置するハート＆リボン（SF Symbols: "heart.fill", "sparkles"）
                HStack {
                    ZStack {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(Color.yellow)
                            .shadow(color: .orange.opacity(0.5), radius: 2)
                        
                        Image(systemName: "sparkle")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.white)
                            .offset(x: -8, y: -8)
                    }
                    Spacer()
                }
                .padding(.horizontal, 40)
                .offset(y: -85)
            }
        }
    }

}
