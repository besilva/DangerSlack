//
//  SlackRouter.swift
//  
//
//  Created by Bernardo Silva on 03/02/21.
//

import Foundation

public enum SlackRouter: Router {
    case users
    case channels
    case message(channel: String, text: String)

    public var host: String {
        return "slack.com"
    }


    public var path: String {
        switch self {
        case .users:
            return "/api/users.list"
        case .channels:
            return "/api/conversations.list"
        case .message:
            return "/api/chat.postMessage"
        }
    }

    public var parameters: [URLQueryItem] {
        switch self {
        case let .message(channel, text):
            return [
                URLQueryItem(name: "channel", value: channel),
                URLQueryItem(name: "text", value: text)
            ]
        default:
            return []
        }

    }

    public var method: String {
        switch self {
        case .channels, .users:
            return "GET"
        case .message:
            return "POST"
        }
    }

    public func generateParams(token: String?) -> [URLQueryItem]  {
        var parameters = [URLQueryItem(name: "token", value: token)]
        parameters.append(contentsOf: self.parameters)
        return parameters
    }

}
