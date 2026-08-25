//
//  TopScreenView+planningView.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI

extension TopScreenView {
    var planningView: some View {
        ZStack {
            VStack(spacing: 24) {
                Spacer()
                appTitle
                    .opacity(vm.shouldOpenJourneyBook ? 0 : 1)
                    .offset(y: vm.shouldOpenJourneyBook ? -40 : 0)
                    .animation(
                        .easeInOut(duration: 0.6),
                        value: vm.shouldOpenJourneyBook
                    )
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        languageMenu
                            .opacity(vm.shouldOpenJourneyBook ? 0 : 1)
                            .offset(y: vm.shouldOpenJourneyBook ? -120 : 0)
                            .animation(
                                .easeInOut(duration: 0.6).delay(0.1),
                                value: vm.shouldOpenJourneyBook
                            )
                        departureSection
                            .opacity(vm.shouldOpenJourneyBook ? 0 : 1)
                            .offset(y: vm.shouldOpenJourneyBook ? -160 : 0)
                            .animation(
                                .easeInOut(duration: 0.6).delay(0.2),
                                value: vm.shouldOpenJourneyBook
                            )
                        destinationSection
                            .opacity(vm.shouldOpenJourneyBook ? 0 : 1)
                            .offset(y: vm.shouldOpenJourneyBook ? -200 : 0)
                            .animation(
                                .easeInOut(duration: 0.6).delay(0.2),
                                value: vm.shouldOpenJourneyBook
                            )
                        periodSection
                            .opacity(vm.shouldOpenJourneyBook ? 0 : 1)
                            .offset(y: vm.shouldOpenJourneyBook ? -240 : 0)
                            .animation(
                                .easeInOut(duration: 0.6).delay(0.3),
                                value: vm.shouldOpenJourneyBook
                            )
                        preferenceSection
                            .opacity(vm.shouldOpenJourneyBook ? 0 : 1)
                            .offset(y: vm.shouldOpenJourneyBook ? -280 : 0)
                            .animation(
                                .easeInOut(duration: 0.6).delay(0.4),
                                value: vm.shouldOpenJourneyBook
                            )
                    }
                    Spacer()
                }
                ZStack {
                    switch vm.apiRequestStatus {
                    case .waitingForRequest:
                        createJourneyBookButton
                            .opacity(vm.isSubmitVisible ? 1 : 0)
                            .offset(y: vm.isSubmitVisible ? 0 : -320)
                            .animation(
                                .easeInOut(duration: 0.6).delay(0.5),
                                value: vm.isSubmitVisible
                            )
                    case .requesting:
                        EmptyView()
                    case .receiveResponse, .nextRequest:
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .fontWeight(.bold)
                                .frame(width: 20, height: 20)
                                .foregroundStyle(subThemeColor)
                            Text("Request Succeded!")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(subThemeColor)
                        }
                    }
                    airplaneLoading
                        .offset(x: vm.apiRequestStatus.beforeRequesting ? -400 : 400)
                        .animation(
                            .linear(duration: 4.0),
                            value: vm.apiRequestStatus
                        )
                        .opacity(vm.isAirplaneVisible ? 1 : 0)
                }
                .opacity(vm.shouldOpenJourneyBook ? 0 : 1)
                .offset(y: vm.shouldOpenJourneyBook ? -320 : 0)
                .animation(
                    .easeInOut(duration: 0.6).delay(0.5),
                    value: vm.shouldOpenJourneyBook
                )
                Spacer()
            }
            DecorationView(vm: .init(city: $vm.selectedDestination))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .allowsHitTesting(false)
        }
        .background(backgroundColor)
        .onAppear {
            vm.isSubmitVisible = true
        }
        .onChange(of: vm.shouldOpenJourneyBook) {
            if !vm.shouldOpenJourneyBook {
                vm.apiRequestStatus = .waitingForRequest
            }
        }
        .onChange(of: vm.apiRequestStatus) {
            updateAirplaneVisibility(apiRequestStatus: vm.apiRequestStatus)
        }
    }

    func updateAirplaneVisibility(apiRequestStatus: APIRequestStatus) {
        if apiRequestStatus == .requesting {
            vm.isAirplaneVisible = true
        } else {
            withAnimation(.easeInOut) {
                vm.isAirplaneVisible = false
            }
        }
    }
}

private extension TopScreenView {
    var appTitle: some View {
        HStack {
            Text("Travel Plus")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(mainThemeColor)
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(mainThemeColor)
                .frame(width: 30, height: 30)
        }
    }

    var languageMenu: some View {
        HStack {
            HStack {
                title("Language*")
                Spacer()
            }
            .frame(width: titleFrameWidth)
            menu(vm.selectedLanguage?.text ?? "Select") {
                Button(
                    "Select",
                    action: {
                        vm.updateSelectedLanguage(nil)
                    }
                )
                Divider()
                ForEach(Language.allCases, id: \.self) { language in
                    Button(
                        language.text,
                        action: {
                            vm.updateSelectedLanguage(language)
                        }
                    )
                    .foregroundStyle(sectionMainTextColor)
                }
            }
        }
    }

    var departureSection: some View {
        HStack {
            HStack {
                title("Departure*")
                Spacer()
            }
            .frame(width: titleFrameWidth)
            menu(countryEmojiAndCityName(vm.selectedDeparture)) {
                Button(
                    "Select",
                    action: {
                        vm.updateSelectedDeparture(nil)
                    }
                )
                Divider()
                ForEach(City.allCases, id: \.self) { city in
                    Button(
                        countryEmojiAndCityName(city),
                        action: {
                            vm.updateSelectedDeparture(city)
                        }
                    )
                    .foregroundStyle(sectionMainTextColor)
                }
            }
        }
    }

    var destinationSection: some View {
        HStack {
            HStack {
                title("Destination*")
                Spacer()
            }
            .frame(width: titleFrameWidth)
            menu(countryEmojiAndCityName(vm.selectedDestination)) {
                Button(
                    "Select",
                    action: {
                        vm.updateSelectedDestination(nil)
                    }
                )
                Divider()
                ForEach(City.allCases, id: \.self) { city in
                    if city != vm.selectedDeparture {
                        Button(
                            countryEmojiAndCityName(city),
                            action: {
                                vm.updateSelectedDestination(city)
                            }
                        )
                        .foregroundStyle(sectionMainTextColor)
                    }
                }
            }
        }
    }

    func countryEmojiAndCityName(_ city: City?) -> String {
        guard let city else {
            return "Select"
        }
        return "\(city.country.emoji) \(city.text)"
    }

    var periodSection: some View {
        HStack(alignment: .top) {
            HStack {
                title("Period*")
                Spacer()
            }
            .frame(width: titleFrameWidth)
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Image(systemName: "airplane.departure")
                        .frame(width: 12, height: 12)
                        .foregroundStyle(mainThemeColor)
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.white)
                            .frame(width: 105, height: 30)
                        DatePicker(
                            "from",
                            selection: $vm.periodStartDate,
                            displayedComponents: .date
                        )
                        .labelsHidden()
                    }
                    .onChange(of: vm.periodStartDate) {
                        if vm.periodEndDate < vm.periodStartDate {
                            vm.periodEndDate = vm.periodStartDate
                        }
                    }
                }
                HStack(spacing: 16) {
                    Image(systemName: "airplane.arrival")
                        .frame(width: 12, height: 12)
                        .foregroundStyle(mainThemeColor)
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.white)
                            .frame(width: 105, height: 30)
                        DatePicker(
                            "to",
                            selection: $vm.periodEndDate,
                            displayedComponents: .date
                        )
                        .labelsHidden()
                    }
                }
            }
        }
    }

    var preferenceSection: some View {
        HStack(alignment: .top) {
            HStack {
                title("Preference*")
                Spacer()
            }
            .frame(width: titleFrameWidth)
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 28) {
                    ForEach([MBTI.e, MBTI.i], id: \.self) { mbti in
                        Button(action: {
                            vm.updateSelectedMbti(mbti)
                        }, label: {
                            HStack {
                                Image(systemName: vm.selectedMbti == mbti ? "largecircle.fill.circle" : "circle")
                                    .foregroundStyle(mainThemeColor)
                                Text(mbti.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(mainThemeColor)
                            }
                        })
                    }
                }
                Button(action: {
                    vm.updateSelectedMbti(.idn)
                }, label: {
                    HStack {
                        Image(systemName: vm.selectedMbti == .idn ? "largecircle.fill.circle" : "circle")
                            .foregroundStyle(mainThemeColor)
                        Text(MBTI.idn.rawValue)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(mainThemeColor)
                    }
                })
            }
        }
    }

    func title(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 18, weight: .bold))
            .foregroundStyle(mainThemeColor)
    }

    func menu<Content: View>(
        _ label: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        Menu {
            content()
        } label: {
            HStack {
                Text(label)
                    .foregroundStyle(sectionMainTextColor)
                Spacer()
                Image(systemName: "chevron.down")
                    .resizable()
                    .fontWeight(.bold)
                    .foregroundStyle(buttonTextColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12, height: 12)
                    .padding(4)
                    .background(subThemeColor)
                    .cornerRadius(6)
            }
            .frame(maxWidth: optionBoxWidth)
            .padding(.leading, 12)
            .padding(.trailing, 8)
            .padding(.vertical, 8)
            .background(.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
        }
    }

    var createJourneyBookButton: some View {
        Button(action: {
            Task {
                await vm.submitUserInfo()
            }
        }, label: {
            Text("Create Journey Book")
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(vm.isAllOptionSelected ? subThemeColor : disableButtonBackgroundColor)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
        })
        .disabled(!vm.isAllOptionSelected)
    }

    var airplaneLoading: some View {
        HStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, subThemeColor]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 120, height: 20)
                .cornerRadius(4)
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(subThemeColor)
                .frame(width: 48, height: 48)
        }
    }
}

private extension Int {
    var dayText: String {
        let suffix = self > 1 ? "days" : "day"
        return String(self) + " " + suffix
    }
}
