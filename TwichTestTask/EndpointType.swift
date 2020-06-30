//
//  EndpointType.swift
//  TwichTestTask
//
//  Created by Максим Окунеев on 6/30/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
