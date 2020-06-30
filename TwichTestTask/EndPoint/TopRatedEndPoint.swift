//
//  TopRatedEndPoint.swift
//  TwichTestTask
//
//  Created by Максим Окунеев on 6/30/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

public enum TwitchApi {
    case topRated
    case image(url: String)
}

extension TwitchApi: EndPointType {
    
    var environmentBaseURL : String {
        switch self{
        case .topRated:
            return "https://api.twitch.tv/"
        case .image(let url):
                return url
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .topRated:
            return "kraken/games/top"
        case .image(_):
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .topRated:
            return .requestParametersAndHeaders(bodyParameters: nil,
                                                bodyEncoding: .urlEncoding,
                                                urlParameters: nil,
                                                additionHeaders: [ "Client-ID": NetworkManagerTopRated.APIKey,
                                                    "Accept": "application/vnd.twitchtv.v5+json" ])
        case .image(_):
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

