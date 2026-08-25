//
//  TopScreenView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

struct TopScreenView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm: TopScreenViewModel

    var backgroundColor: Color {
        vm.selectedDestination?.skyColor ?? Color("background_top")
    }
    var mainThemeColor: Color {
        vm.selectedDestination?.themeColor ?? Color("normal_theme")
    }
    var subThemeColor: Color {
        vm.selectedDestination?.subThemeColor ?? Color("normal_subTheme")
    }
    var buttonTextColor: Color {
        .white
    }
    let titleFrameWidth: CGFloat = 120
    let optionBoxWidth: CGFloat = 200
    let sectionMainTextColor = Color("normal_theme")
    let disableButtonBackgroundColor = Color("background_disabled")

    init(vm: TopScreenViewModel) {
        self.vm = vm
    }

    var body: some View {
        ZStack {
            journeyBookView
                .opacity(vm.shouldOpenJourneyBook ? 1 : 0)
                .animation(
                    .easeIn(duration: 1.0),
                    value: vm.shouldOpenJourneyBook
                )
            planningView
                .opacity(vm.shouldOpenJourneyBook ? 0 : 1)
                .animation(
                    .easeIn(duration: 1.0),
                    value: vm.shouldOpenJourneyBook
                )
        }
    }
}
