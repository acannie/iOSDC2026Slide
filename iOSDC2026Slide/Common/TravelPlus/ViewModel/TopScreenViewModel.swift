//
//  TopScreenViewModel.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/07.
//

import SwiftUI
import Combine

final class TopScreenViewModel: ObservableObject {
    @Published private var userId: UUID
    @Published var selectedLanguage: Language? = .en
    @Published var selectedDeparture: City? = .california
    @Published var selectedDestination: City?
    @Published var selectedMbti: MBTI = .e
    @Published var periodStartDate = Date()
    @Published var periodEndDate = Date()
    @Published var isSubmitVisible = true
    @Published var shouldOpenJourneyBook = false
    @Published var apiRequestStatus: APIRequestStatus = .waitingForRequest
    @Published var isAirplaneVisible = false

    init() {
        self.userId = UUID()

        // Period の初期化
        var periodStartDateComponents = DateComponents()
        periodStartDateComponents.year = 2026
        periodStartDateComponents.month = 9
        periodStartDateComponents.day = 11
        var periodEndDateComponents = DateComponents()
        periodEndDateComponents.year = 2026
        periodEndDateComponents.month = 9
        periodEndDateComponents.day = 13

        let calendar = Calendar.current
        if let date = calendar.date(from: periodStartDateComponents) {
            self.periodStartDate = date
        }
        if let date = calendar.date(from: periodEndDateComponents) {
            self.periodEndDate = date
        }
    }

    var isAllOptionSelected: Bool {
        selectedLanguage != nil
        && selectedDeparture != nil
        && selectedDestination != nil
    }

    func updateSelectedLanguage(_ language: Language?) {
        self.selectedLanguage = language
    }

    func updateSelectedDeparture(_ city: City?) {
        self.selectedDeparture = city
        if city == selectedDestination {
            selectedDestination = nil
        }
    }

    func updateSelectedDestination(_ city: City?) {
        self.selectedDestination = city
    }

    func updateSelectedMbti(_ mbti: MBTI) {
        self.selectedMbti = mbti
    }

    @MainActor
    func submitUserInfo() async {
        apiRequestStatus = .requesting
        try? await Task.sleep(for: .seconds(2))
        apiRequestStatus = .nextRequest
        try? await Task.sleep(for: .seconds(1.5))
        shouldOpenJourneyBook = true
        isSubmitVisible = true
    }
}
