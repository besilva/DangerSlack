//
//  ChannelsResponse.swift
//  
//
//  Created by Bernardo Silva on 03/02/21.
//

import Foundation

// MARK: - ChannelsResponse
public struct ChannelsResponse: Codable {
    let ok: Bool
    let channels: [Channel]
    let responseMetadata: ResponseMetadata

    enum CodingKeys: String, CodingKey {
        case ok, channels
        case responseMetadata = "response_metadata"
    }
}

// MARK: - Channel
public struct Channel: Codable {
    let id, name: String
    let isChannel, isGroup, isIM: Bool
    let created: Int
    let isArchived, isGeneral: Bool
    let unlinked: Int
    let nameNormalized: String
    let isShared: Bool
    let parentConversation: String?
    let creator: String
    let isEXTShared, isOrgShared: Bool
    let sharedTeamIDS: [String]
    let pendingShared, pendingConnectedTeamIDS: [String]
    let isPendingEXTShared, isMember, isPrivate, isMpim: Bool
    let topic, purpose: Purpose
    let previousNames: [String]
    let numMembers: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case isChannel = "is_channel"
        case isGroup = "is_group"
        case isIM = "is_im"
        case created
        case isArchived = "is_archived"
        case isGeneral = "is_general"
        case unlinked
        case nameNormalized = "name_normalized"
        case isShared = "is_shared"
        case parentConversation = "parent_conversation"
        case creator
        case isEXTShared = "is_ext_shared"
        case isOrgShared = "is_org_shared"
        case sharedTeamIDS = "shared_team_ids"
        case pendingShared = "pending_shared"
        case pendingConnectedTeamIDS = "pending_connected_team_ids"
        case isPendingEXTShared = "is_pending_ext_shared"
        case isMember = "is_member"
        case isPrivate = "is_private"
        case isMpim = "is_mpim"
        case topic, purpose
        case previousNames = "previous_names"
        case numMembers = "num_members"
    }
}

// MARK: - Purpose
public struct Purpose: Codable {
    let value, creator: String
    let lastSet: Int

    enum CodingKeys: String, CodingKey {
        case value, creator
        case lastSet = "last_set"
    }
}
