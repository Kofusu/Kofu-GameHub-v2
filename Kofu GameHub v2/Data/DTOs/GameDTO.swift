//
//  GameDTO.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

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
    let ratingTop: Int
    let ratings: [GameRating]
    let ratingCount: Int
    let reviewsTextCount: String
    let added: Int
    let addedByStatus: GameAddedByStatus?
    let metacritic: Int?
    let playtime: Int?
    let suggestionsCount: Int?
    let updated: Date?
    let esrbRating: GameESRBRating?
    let platforms: [GamePlatform]
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug, released, tba, rating, ratings
        case added, metacritic, playtime, updated, platforms
        case backgroundImage = "background_image"
        case ratingTop = "rating_top"
        case ratingCount = "rating_count"
        case reviewsTextCount = "reviews_text_count"
        case addedByStatus = "added_by_status"
        case suggestionsCount = "suggestions_count"
        case esrbRating = "esrb_rating"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Required fields
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        slug = try container.decode(String.self, forKey: .slug)
        tba = try container.decode(Bool.self, forKey: .tba)
        rating = try container.decode(Double.self, forKey: .rating)
        ratingTop = try container.decode(Int.self, forKey: .ratingTop)
        ratings = try container.decode([GameRating].self, forKey: .ratings)
        ratingCount = try container.decode(Int.self, forKey: .ratingCount)
        reviewsTextCount = try container.decode(String.self, forKey: .reviewsTextCount)
        added = try container.decode(Int.self, forKey: .added)
        platforms = try container.decode([GamePlatform].self, forKey: .platforms)
        
        // Optional fields
        addedByStatus = try container.decodeIfPresent(GameAddedByStatus.self, forKey: .addedByStatus)
        metacritic = try container.decodeIfPresent(Int.self, forKey: .metacritic)
        playtime = try container.decodeIfPresent(Int.self, forKey: .playtime)
        suggestionsCount = try container.decodeIfPresent(Int.self, forKey: .suggestionsCount)
        esrbRating = try container.decodeIfPresent(GameESRBRating.self, forKey: .esrbRating)
        
        if let releasedString = try container.decodeIfPresent(String.self, forKey: .released) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            released = dateFormatter.date(from: releasedString)
        } else {
            released = nil
        }
        
        if let updatedString = try container.decodeIfPresent(String.self, forKey: .updated) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            updated = dateFormatter.date(from: updatedString)
        } else {
            updated = nil
        }
        
        if let backgroundImageString = try container.decodeIfPresent(String.self, forKey: .backgroundImage) {
            backgroundImage = URL(string: backgroundImageString)
        } else {
            backgroundImage = nil
        }
    }
    
    func toEntity() -> Game {
        Game(id: id, name: name, released: released, backgroundImage: backgroundImage, rating: rating, updated: updated)
    }
}

// Game Rating
struct GameRating: Identifiable, Codable {
    let id: Int
    let title: RatingTitle
    let count: Int
    let percent: Double
}

enum RatingTitle: String, Codable {
    case exceptional = "exceptional"
    case meh = "meh"
    case recommended = "recommended"
    case skip = "skip"
}

// AddedByStatus
struct GameAddedByStatus: Codable {
    let yet, owned, beaten, toplay: Int
    let dropped, playing: Int
}

// ESRB Rating
struct GameESRBRating: Identifiable, Codable {
    let id: Int
    let slug: String
    let name: String
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
        
        // ✅ Safe date parsing
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
