//
//  Game.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

public struct Game: Identifiable {
    public let id: Int
    public let name: String
    public let released: Date?
    public let backgroundImage: URL?
    public let rating: Double
    public let updated: Date?
    
    public init(id: Int, name: String, released: Date?, backgroundImage: URL?, rating: Double, updated: Date?) {
        self.id = id
        self.name = name
        self.released = released
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.updated = updated
    }
}
