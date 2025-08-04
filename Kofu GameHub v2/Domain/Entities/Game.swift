//
//  Game.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

struct Game: Identifiable {
    var id: Int
    var name: String
    var slug: String
    var released: Date?
    var tba: Bool
    var backgroundImage: URL
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
}
