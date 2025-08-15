//
//  DeveloperDTO.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation
import Core

struct DeveloperListResponse: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [DeveloperDTO]
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Required Fields
        count = try container.decode(Int.self, forKey: .count)
        results = try container.decode([DeveloperDTO].self, forKey: .results)
        
        // Optional Fields
        if let nextString = try container.decodeIfPresent(String.self, forKey: .next) {
            next = URL(string: nextString)
        } else {
            next = nil
        }
        
        if let previousString = try container.decodeIfPresent(String.self, forKey: .previous) {
            previous = URL(string: previousString)
        } else {
            previous = nil
        }
    }
}

struct DeveloperDTO: Identifiable, Codable {
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
        
        // Safe URL parsing - no force unwrapping
        if let imageBackgroundString = try container.decodeIfPresent(String.self, forKey: .imageBackground) {
            imageBackground = URL(string: imageBackgroundString)
        } else {
            imageBackground = nil
        }
    }
    
    func toEntity() -> Developer {
        Developer(id: id, name: name, gamesCount: gamesCount, imageBackground: imageBackground)
    }
}
