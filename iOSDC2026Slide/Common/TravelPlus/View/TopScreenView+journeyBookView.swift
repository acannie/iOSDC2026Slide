//
//  TopScreenView+journeyBookView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

extension TopScreenView {
    var journeyBookView: some View {
        ZStack {
//            Image("mock_travel_journey_book_cover")
//                .resizable()
//                .ignoresSafeArea()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 40)
//                .clipped()
            VStack {
                HStack {
                    dismissButton
                        .padding(.leading, 12)
                        .padding(.top, 12)
                    Spacer()
                }
                .padding(.top, 50)
                Spacer()
                HStack {
                    VStack(spacing: 50) {
                        VStack(spacing: 12) {
                            Text("Start your new trip\nwith\nvoice guide")
                                .font(.system(size: 30, weight: .semibold))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            Text("Your Journey, Your Story.")
                                .font(.system(size: 16, weight: .light))
                                .foregroundStyle(.white)
                        }
                        Button(
                            action: {},
                            label: {
                                Text("DISCOVER BY PAGE")
                                    .foregroundStyle(Color("taipei_sky"))
                                    .font(.system(size: 12, weight: .regular))
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 12)
                                    .background(.white)
                                    .cornerRadius(12)
                            }
                        )
                    }
                    Spacer()
                }
                .padding(.leading, 12)
                Spacer()
            }
        }
    }
}

private extension TopScreenView {
    var dismissButton: some View {
        Button(action: {
            withAnimation {
                vm.shouldOpenJourneyBook = false
            }
        }, label: {
            Image(systemName: "arrowshape.backward.fill")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 24, height: 24)
                .padding(12)
                .background(.ultraThinMaterial)
                .cornerRadius(24)
        })
    }
}
