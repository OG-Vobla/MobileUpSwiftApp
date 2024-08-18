//
//  PhotoModels.swift
//  MobileUpSwiftApp
//
//  Created by Радэль Зубаиров on 18.08.2024.
//

import Foundation

// MARK: - Response
struct ResponseData: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Item]
    let nextFrom: String?

    enum CodingKeys: String, CodingKey {
        case count
        case items
        case nextFrom = "next_from"
    }
}

// MARK: - Item
struct Item: Codable {
    let albumID: Int
    let date: Int
    let id: Int
    let ownerID: Int
    let postID: Int
    let sizes: [Size]
    let squareCrop: String?
    let text: String
    let userID: Int
    let webViewToken: String
    let hasTags: Bool
    let origPhoto: OrigPhoto

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date
        case id
        case ownerID = "owner_id"
        case postID = "post_id"
        case sizes
        case squareCrop = "square_crop"
        case text
        case userID = "user_id"
        case webViewToken = "web_view_token"
        case hasTags = "has_tags"
        case origPhoto = "orig_photo"
    }
}

// MARK: - Size
struct Size: Codable {
    let height: Int
    let type: String
    let width: Int
    let url: String
}

// MARK: - OrigPhoto
struct OrigPhoto: Codable {
    let height: Int
    let type: String
    let url: String
    let width: Int
}
