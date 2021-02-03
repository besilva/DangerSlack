//
//  SlackDefaultResponse.swift
//  
//
//  Created by Bernardo Silva on 03/02/21.
//

import Foundation

// MARK: - ResponseMetadata
public struct ResponseMetadata: Codable {
    let nextCursor: String

    enum CodingKeys: String, CodingKey {
        case nextCursor = "next_cursor"
    }
}
