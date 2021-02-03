//
//  MessageResponse.swift
//  
//
//  Created by Bernardo Silva on 03/02/21.
//

import Foundation

// MARK: - MessageResponse
public struct MessageResponse: Codable {
    let ok: Bool
    let channel, ts: String?
    let message: Message?
}

// MARK: - Message
public struct Message: Codable {
    let botID, type, text, user: String?
    let ts, team: String?
    let botProfile: BotProfile?

    enum CodingKeys: String, CodingKey {
        case botID = "bot_id"
        case type, text, user, ts, team
        case botProfile = "bot_profile"
    }
}

// MARK: - BotProfile
public struct BotProfile: Codable {
    let id: String
    let deleted: Bool
    let name: String
    let updated: Int
    let appID: String
    let icons: Icons
    let teamID: String

    enum CodingKeys: String, CodingKey {
        case id, deleted, name, updated
        case appID = "app_id"
        case icons
        case teamID = "team_id"
    }
}

// MARK: - Icons
public struct Icons: Codable {
    let image36, image48, image72: String

    enum CodingKeys: String, CodingKey {
        case image36 = "image_36"
        case image48 = "image_48"
        case image72 = "image_72"
    }
}
