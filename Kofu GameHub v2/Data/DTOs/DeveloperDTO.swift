//
//  DeveloperDTO.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

struct DeveloperDTO: Identifiable, Decodable {
    let id: Int
    let name: String
    let gamesCount: Int
    let imageBackground: URL?
    
    enum CodingKeys: String, CodingKey {
        case id, name
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
    }
}
