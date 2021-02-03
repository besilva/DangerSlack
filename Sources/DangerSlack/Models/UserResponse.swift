//
//  UserResponse.swift
//  
//
//  Created by Bernardo Silva on 03/02/21.
//

import Foundation

// MARK: - UserResponse
public struct UserResponse: Codable {
    let ok: Bool
    let members: [Member]
    let cacheTs: Int
    let responseMetadata: ResponseMetadata

    enum CodingKeys: String, CodingKey {
        case ok, members
        case cacheTs = "cache_ts"
        case responseMetadata = "response_metadata"
    }
}

// MARK: - Member
public struct Member: Codable {
    let id, teamID, name: String
    let deleted: Bool
    let color, realName, tz, tzLabel: String?
    let tzOffset: Int?
    let profile: Profile
    let isAdmin, isOwner, isPrimaryOwner, isRestricted: Bool?
    let isUltraRestricted: Bool?
    let isBot, isAppUser: Bool
    let updated: Int

    enum CodingKeys: String, CodingKey {
        case id
        case teamID = "team_id"
        case name, deleted, color
        case realName = "real_name"
        case tz
        case tzLabel = "tz_label"
        case tzOffset = "tz_offset"
        case profile
        case isAdmin = "is_admin"
        case isOwner = "is_owner"
        case isPrimaryOwner = "is_primary_owner"
        case isRestricted = "is_restricted"
        case isUltraRestricted = "is_ultra_restricted"
        case isBot = "is_bot"
        case isAppUser = "is_app_user"
        case updated
    }
}

// MARK: - Profile
public struct Profile: Codable {
    let title, phone, skype, realName: String
    let realNameNormalized, displayName, displayNameNormalized: String
    let fields: String?
    let statusText, statusEmoji: String
    let statusExpiration: Int
    let avatarHash: String
    let alwaysActive: Bool?
    let firstName, lastName: String?
    let image24, image32, image48, image72: String
    let image192, image512: String
    let statusTextCanonical, team: String
    let email, apiAppID, botID: String?
    let imageOriginal: String?
    let isCustomImage: Bool?
    let image1024: String?

    enum CodingKeys: String, CodingKey {
        case title, phone, skype
        case realName = "real_name"
        case realNameNormalized = "real_name_normalized"
        case displayName = "display_name"
        case displayNameNormalized = "display_name_normalized"
        case fields
        case statusText = "status_text"
        case statusEmoji = "status_emoji"
        case statusExpiration = "status_expiration"
        case avatarHash = "avatar_hash"
        case alwaysActive = "always_active"
        case firstName = "first_name"
        case lastName = "last_name"
        case image24 = "image_24"
        case image32 = "image_32"
        case image48 = "image_48"
        case image72 = "image_72"
        case image192 = "image_192"
        case image512 = "image_512"
        case statusTextCanonical = "status_text_canonical"
        case team, email
        case apiAppID = "api_app_id"
        case botID = "bot_id"
        case imageOriginal = "image_original"
        case isCustomImage = "is_custom_image"
        case image1024 = "image_1024"
    }
}


