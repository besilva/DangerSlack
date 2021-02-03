//
//  Router.swift
//  
//
//  Created by Bernardo Silva on 03/02/21.
//

import Foundation

public protocol Router {
    var host: String { get }
    var path:String { get }
    var parameters: [URLQueryItem] { get }
    var method: String { get }
    func generateParams(token: String?) -> [URLQueryItem]
}
