//
//  DetailGame.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 03/08/25.
//

import Foundation

struct DetailGame: Identifiable {
    var id: Int
    var slug: String
    var name: String
    var nameOriginal: String
    var description: String
    var metacriticPlatforms: [DetailGameMetacriticPlatform]
    var released: Date?
    var tba: Bool
    var backgroundImage: URL
    var backgroundImageAdditional: URL
    var website: URL
    var screenshotsCount: Int
    var moviesCount: Int
    var creatorsCount: Int
    var achivementsCount: Int
    var parentAchivementsCount: Int
    var redditURL: URL
    var redditName: String
    var redditDescription: String
    var redditLogo: String
    var metacriticURL: URL
    var redditCount: Int
    var twitchCount: Int
    var youtubeCount: Int
    var rating: Double
    var ratingTop: Int
    var ratings: [GameRating]
    var ratingCount: Int
    var reviewsTextCount: String
    var added: Int
    var addedByStatus: GameAddedByStatus
    var metacritic, playtime, suggestionsCount: Int
    var updated: Date
    var esrbRating: GameESRBRating
    var platforms: [GamePlatform]
    var parentsCount: Int
    var additionsCount: Int
    var gameSeriessCount: Int
}
