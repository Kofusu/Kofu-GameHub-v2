//
//  DetailGame.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 03/08/25.
//

import Foundation

public struct DetailGame {
    public let id: Int
    public let name: String
    public let description: String?
    public let released: Date?
    public let backgroundImage: URL?
    public let website: URL?
    public let rating: Double
    public let tags: [String]?

    public init(
        id: Int,
        name: String,
        description: String?,
        released: Date?,
        backgroundImage: URL?,
        website: URL?,
        rating: Double,
        tags: [String]?
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.released = released
        self.backgroundImage = backgroundImage
        self.website = website
        self.rating = rating
        self.tags = tags
    }
}
