//
//  DetailGameDTO.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

struct DetailGameDTO: Codable {
    let id: Int
    let slug: String
    let name: String
    let nameOriginal: String
    let description: String?
    let metacriticPlatforms: [DetailGameMetacriticPlatform]
    let released: Date?
    let tba: Bool
    let backgroundImage: URL?
    let backgroundImageAdditional: URL?
    let website: URL?
    let screenshotsCount: Int
    let moviesCount: Int
    let creatorsCount: Int
    let achievementsCount: Int
    let parentAchievementsCount: Int
    let redditURL: URL?
    let redditName: String?
    let redditDescription: String?
    let redditLogo: String?
    let metacriticURL: URL?
    let redditCount: Int?
    let twitchCount: Int?
    let youtubeCount: Int?
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
    let parentsCount: Int
    let additionsCount: Int
    let gameSeriesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, slug, name, description, released, tba, website, rating, ratings
        case added, metacritic, playtime, updated, platforms
        case nameOriginal = "name_original"
        case metacriticPlatforms = "metacritic_platforms"
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case screenshotsCount = "screenshots_count"
        case moviesCount = "movies_count"
        case creatorsCount = "creators_count"
        case achievementsCount = "achievements_count"
        case parentAchievementsCount = "parent_achievements_count"
        case redditURL = "reddit_url"
        case redditName = "reddit_name"
        case redditDescription = "reddit_description"
        case redditLogo = "reddit_logo"
        case metacriticURL = "metacritic_url"
        case redditCount = "reddit_count"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case ratingTop = "rating_top"
        case ratingCount = "rating_count"
        case reviewsTextCount = "reviews_text_count"
        case addedByStatus = "added_by_status"
        case suggestionsCount = "suggestions_count"
        case esrbRating = "esrb_rating"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Required fields
        id = try container.decode(Int.self, forKey: .id)
        slug = try container.decode(String.self, forKey: .slug)
        name = try container.decode(String.self, forKey: .name)
        nameOriginal = try container.decode(String.self, forKey: .nameOriginal)
        metacriticPlatforms = try container.decode([DetailGameMetacriticPlatform].self, forKey: .metacriticPlatforms)
        tba = try container.decode(Bool.self, forKey: .tba)
        screenshotsCount = try container.decode(Int.self, forKey: .screenshotsCount)
        moviesCount = try container.decode(Int.self, forKey: .moviesCount)
        creatorsCount = try container.decode(Int.self, forKey: .creatorsCount)
        achievementsCount = try container.decode(Int.self, forKey: .achievementsCount)
        parentAchievementsCount = try container.decode(Int.self, forKey: .parentAchievementsCount)
        rating = try container.decode(Double.self, forKey: .rating)
        ratingTop = try container.decode(Int.self, forKey: .ratingTop)
        ratings = try container.decode([GameRating].self, forKey: .ratings)
        ratingCount = try container.decode(Int.self, forKey: .ratingCount)
        reviewsTextCount = try container.decode(String.self, forKey: .reviewsTextCount)
        added = try container.decode(Int.self, forKey: .added)
        platforms = try container.decode([GamePlatform].self, forKey: .platforms)
        parentsCount = try container.decode(Int.self, forKey: .parentsCount)
        additionsCount = try container.decode(Int.self, forKey: .additionsCount)
        gameSeriesCount = try container.decode(Int.self, forKey: .gameSeriesCount)
        
        // Optional fields - safe decoding
        description = try container.decodeIfPresent(String.self, forKey: .description)
        addedByStatus = try container.decodeIfPresent(GameAddedByStatus.self, forKey: .addedByStatus)
        metacritic = try container.decodeIfPresent(Int.self, forKey: .metacritic)
        playtime = try container.decodeIfPresent(Int.self, forKey: .playtime)
        suggestionsCount = try container.decodeIfPresent(Int.self, forKey: .suggestionsCount)
        esrbRating = try container.decodeIfPresent(GameESRBRating.self, forKey: .esrbRating)
        redditName = try container.decodeIfPresent(String.self, forKey: .redditName)
        redditDescription = try container.decodeIfPresent(String.self, forKey: .redditDescription)
        redditLogo = try container.decodeIfPresent(String.self, forKey: .redditLogo)
        redditCount = try container.decodeIfPresent(Int.self, forKey: .redditCount)
        twitchCount = try container.decodeIfPresent(Int.self, forKey: .twitchCount)
        youtubeCount = try container.decodeIfPresent(Int.self, forKey: .youtubeCount)
        
        // Safe date parsing - no force unwrapping
        if let releasedString = try container.decodeIfPresent(String.self, forKey: .released) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            released = dateFormatter.date(from: releasedString)
        } else {
            released = nil
        }
        
        if let updatedString = try container.decodeIfPresent(String.self, forKey: .updated) {
            let dateFormatter = ISO8601DateFormatter()
            updated = dateFormatter.date(from: updatedString)
        } else {
            updated = nil
        }
        
        // Safe URL parsing - no force unwrapping
        if let backgroundImageString = try container.decodeIfPresent(String.self, forKey: .backgroundImage) {
            backgroundImage = URL(string: backgroundImageString)
        } else {
            backgroundImage = nil
        }
        
        if let backgroundImageAdditionalString = try container.decodeIfPresent(String.self, forKey: .backgroundImageAdditional) {
            backgroundImageAdditional = URL(string: backgroundImageAdditionalString)
        } else {
            backgroundImageAdditional = nil
        }
        
        if let websiteString = try container.decodeIfPresent(String.self, forKey: .website) {
            website = URL(string: websiteString)
        } else {
            website = nil
        }
        
        if let redditURLString = try container.decodeIfPresent(String.self, forKey: .redditURL) {
            redditURL = URL(string: redditURLString)
        } else {
            redditURL = nil
        }
        
        if let metacriticURLString = try container.decodeIfPresent(String.self, forKey: .metacriticURL) {
            metacriticURL = URL(string: metacriticURLString)
        } else {
            metacriticURL = nil
        }
    }
    
    func toEntity() -> DetailGame {
        DetailGame(id: id, name: name, nameOriginal: nameOriginal, description: description, released: released, backgroundImage: backgroundImage, backgroundImageAdditional: backgroundImageAdditional, website: website, rating: rating, updated: updated)
    }
}

struct DetailGameMetacriticPlatform: Codable {
    let metascore: Int?  // Made optional - can be null
    let url: URL?  // Made optional - can be null
    
    enum CodingKeys: String, CodingKey {
        case metascore, url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        metascore = try container.decodeIfPresent(Int.self, forKey: .metascore)
        
        // Safe URL parsing - no force unwrapping
        if let urlString = try container.decodeIfPresent(String.self, forKey: .url) {
            url = URL(string: urlString)
        } else {
            url = nil
        }
    }
}
