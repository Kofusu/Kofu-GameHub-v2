//
//  DetailGame.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 03/08/25.
//

import Foundation

struct DetailGame: Identifiable {
    let id: Int
    let slug: String
    let name: String
    let nameOriginal: String
    let description: String
    let metacriticPlatforms: [DetailGameMetacriticPlatform]
    let released: Date?
    let tba: Bool
    let backgroundImage: URL
    let backgroundImageAdditional: URL
    let website: URL
    let screenshotsCount: Int
    let moviesCount: Int
    let creatorsCount: Int
    let achivementsCount: Int
    let parentAchivementsCount: Int
    let redditURL: URL
    let redditName: String
    let redditDescription: String
    let redditLogo: String
    let metacriticURL: URL
    let redditCount: Int
    let twitchCount: Int
    let youtubeCount: Int
    let rating: Double
    let ratingTop: Int
    let ratings: [GameRating]
    let ratingCount: Int
    let reviewsTextCount: String
    let added: Int
    let addedByStatus: GameAddedByStatus
    let metacritic, playtime, suggestionsCount: Int
    let updated: Date
    let esrbRating: GameESRBRating
    let platforms: [GamePlatform]
    let parentsCount: Int
    let additionsCount: Int
    let gameSeriessCount: Int
}
