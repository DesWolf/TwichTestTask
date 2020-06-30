//
//  NetworkManagerTopRated.swift
//  TwichTestTask
//
//  Created by Максим Окунеев on 6/30/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

enum NetworkResponse:String {
    case success
    case dataNotFound = "404-500 Data not found"
    case unServer = "503 Service Unavailable"
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

struct NetworkManagerTopRated {
    static let APIKey = "sd4grh0omdj9a31exnpikhrmsu3v46"
    private let router = Router<TwitchApi>()
    
    func fetchTopRated(completion: @escaping (_ message: ServerAnswer?,_ error: String?)->()){
        router.request(.topRated) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(ServerAnswer.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }

    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 404...500: return .failure(NetworkResponse.dataNotFound.rawValue)
        case 503: return .failure(NetworkResponse.unServer.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
