//
//  TopRatedModel.swift
//  TwichTestTask
//
//  Created by Максим Окунеев on 6/30/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

struct ServerAnswer: Decodable {
    let _total: Int?
    let top: TopRatedModel?
}

struct TopRatedModel: Decodable {
    let channels: Int?
    let viewers: Int?
    let game: Game?
}

struct Game: Decodable {
    let _id: Int?
    let box: LinksForImage?
    let giantbomb_id: Int?
    let logo: LinksForImage?
    let name: String?
}

struct LinksForImage: Decodable {
    let large: String?
    let medium: String?
    let small: String?
    let template: String?
}
