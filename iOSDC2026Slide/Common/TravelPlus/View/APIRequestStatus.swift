//
//  APIRequestStatus.swift
//  TravelPlus
//
//  Created by SASAOKA Akane on 2025/07/31.
//

enum APIRequestStatus {
    case waitingForRequest
    case requesting
    case receiveResponse
    case nextRequest

    var beforeRequesting: Bool {
        self == .waitingForRequest
    }
}
