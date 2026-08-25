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
    @Published var selectedLanguage: Language?
    @Published var selectedDeparture: City?
    @Published var selectedDestination: City?
    @Published var selectedMbti: MBTI = .e
    @Published var periodStartDate = Date()
    @Published var periodEndDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    @Published var isSubmitVisible = true
    @Published var shouldOpenJourneyBook = false
    @Published var apiRequestStatus: APIRequestStatus = .waitingForRequest
    @Published var isAirplaneVisible = false

    init() {
        self.userId = UUID()
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
