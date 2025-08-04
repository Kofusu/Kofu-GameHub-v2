//
//  GameRating.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

struct GameRating: Identifiable {
    var id: Int
    var title: RatingTitle
    var count: Int
    var percent: Double
}
