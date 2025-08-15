//
//  GameDTO.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation
import Core

struct GameListResponse: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [GameDTO]
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Required Fields
        count = try container.decode(Int.self, forKey: .count)
        results = try container.decode([GameDTO].self, forKey: .results)
        
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

// Core
struct GameDTO: Codable {
    let id: Int
    let name: String
    let slug: String
    let released: Date?
    let tba: Bool
    let backgroundImage: URL?
    let rating: Double
    let updated: Date?
    let platforms: [GamePlatform]
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug, released, tba, rating
        case updated, platforms
        case backgroundImage = "background_image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Required fields
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        slug = try container.decode(String.self, forKey: .slug)
        tba = try container.decode(Bool.self, forKey: .tba)
        rating = try container.decode(Double.self, forKey: .rating)
        platforms = try container.decode([GamePlatform].self, forKey: .platforms)
        
        
        // Date parsing for 'released'
        if let releasedString = try container.decodeIfPresent(String.self, forKey: .released) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            released = dateFormatter.date(from: releasedString)
        } else {
            released = nil
        }
        
        // Date parsing for 'updated'
        if let updatedString = try container.decodeIfPresent(String.self, forKey: .updated) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            updated = dateFormatter.date(from: updatedString)
        } else {
            updated = nil
        }
        
        // Safe URL parsing
        if let backgroundImageString = try container.decodeIfPresent(String.self, forKey: .backgroundImage),
           !backgroundImageString.isEmpty {
            backgroundImage = URL(string: backgroundImageString)
        } else {
            backgroundImage = nil
        }
    }
    
    func toEntity() -> Game {
        Game(id: id, name: name, released: released, backgroundImage: backgroundImage, rating: rating, updated: updated)
    }
}

// Platform
struct GamePlatform: Codable {
    let platform: PlatformPlatform
    let releasedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        platform = try container.decode(PlatformPlatform.self, forKey: .platform)
        
        // Simple date parsing
        if let releasedAtString = try container.decodeIfPresent(String.self, forKey: .releasedAt) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            releasedAt = dateFormatter.date(from: releasedAtString)
        } else {
            releasedAt = nil
        }
    }
}

struct PlatformPlatform: Identifiable, Codable {
    let id: Int
    let slug: String
    let name: String
}
