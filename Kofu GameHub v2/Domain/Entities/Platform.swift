//
//  Platform.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

struct Platform: Identifiable {
    var id: Int
    var name: String
    var slug: String
    var gamesCount: Int
    var imageBackground: URL
    var image: URL?
    var yearStart: Date?
    var yearEnd: Date?
}
