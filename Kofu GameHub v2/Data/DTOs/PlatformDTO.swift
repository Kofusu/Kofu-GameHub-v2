//
//  PlatformDTO.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

struct PlatformDTO: Identifiable, Codable {
    let id: Int
    let name: String
    let gamesCount: Int
    let imageBackground: URL?
    let image: URL?
    
    enum CodingKeys: String, CodingKey {
        case id, name, image
        
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        gamesCount = try container.decode(Int.self, forKey: .gamesCount)
        
        if let imageBackgroundString = try container.decodeIfPresent(String.self, forKey: .imageBackground) {
            imageBackground = URL(string: imageBackgroundString)!
        } else {
            imageBackground = nil
        }
        
        if let imageString = try container.decodeIfPresent(String.self, forKey: .image) {
            image = URL(string: imageString)!
        } else {
            image = nil
        }
    }
}

