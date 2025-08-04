//
//  GameER+SRBRating.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

struct GameESRBRating: Identifiable {
    var id: Int
    var slug: ESRBRatingSlug
    var name: ESRBRatingName
}
