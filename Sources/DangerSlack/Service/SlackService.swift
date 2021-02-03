//
//  SlackService.swift
//  
//
//  Created by Bernardo Silva on 03/02/21.
//

import Foundation

public class SlackService {

    open var apiToken: String?

    public init() {
        apiToken = ProcessInfo.processInfo.environment["SLACK_API_TOKEN"]
    }

    open func request<T: Decodable>(router: Router, completion: @escaping (Result<T, Error>) -> ()) {

        var components = URLComponents()
        components.scheme = "https"
        components.host = router.host
        components.path = router.path
        components.queryItems = router.generateParams(token: self.apiToken)

        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in

            guard let verifiedData = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }

            do {
                let responseObject = try JSONDecoder().decode(T.self, from: verifiedData)
                completion(.success(responseObject))
            } catch {
                completion(.failure(error))
            }

        }
        dataTask.resume()
    }

    public func notify(channel: String, text: String) {
        let group = DispatchGroup()
        var channels: [Channel] = []
        group.enter()
        self.request(router: SlackRouter.channels) { (result: Result<ChannelsResponse, Error>) in
            switch result {
            case let .success(response):
                channels = response.channels
            case let .failure(error):
                fatalError(error.localizedDescription)
            }
            group.leave()
        }
        group.wait()
        if let messageChannel = channels.filter({ $0.name == channel}).first {
            sendMessage(channelID: messageChannel.id, text: text)
        } else {
            //erro canal não encontrado
        }

    }

    internal func sendMessage(channelID: String, text: String) {
        let group = DispatchGroup()
        group.enter()
        self.request(router: SlackRouter.message(channel: channelID, text: text)) { (result: Result<MessageResponse, Error>) in
            switch result {
            case let .success(response):
                print("Sucesso")
            case let .failure(error):
                fatalError(error.localizedDescription)
            }
            group.leave()
        }
        group.wait()
    }

    public func notifyPrivately(email: String, text: String) {
        let group = DispatchGroup()
        var members: [Member] = []
        group.enter()
        self.request(router: SlackRouter.users) { (result: Result<UserResponse, Error>) in
            switch result {
            case let .success(response):
                members = response.members
            case let .failure(error):
                fatalError(error.localizedDescription)
            }
            group.leave()
        }
        group.wait()
        if let member = members.filter({ $0.profile.email == email }).first {
            sendMessage(channelID: member.id, text: text)
        } else {
            //erro membro não encontrado
        }

    }

}



