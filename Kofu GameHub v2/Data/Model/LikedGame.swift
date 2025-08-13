//
//  Item.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 01/08/25.
//

import Foundation
import SwiftData

@Model
final class LikedGame: Identifiable {
    @Attribute(.unique) var id: Int
    var name: String
    var imageBackground: URL?
    var released: Date?
    var rating: Double
    
    init(id: Int, name: String, imageBackground: URL?, released: Date?, rating: Double) {
        self.id = id
        self.name = name
        self.imageBackground = imageBackground
        self.released = released
        self.rating = rating

    }
}
