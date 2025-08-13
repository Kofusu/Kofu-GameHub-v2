//
//  DetailGame.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 03/08/25.
//

import Foundation

struct DetailGame {
    let id: Int
    let name: String
    let description: String?
    let released: Date?
    let backgroundImage: URL?
    let website: URL?
    let rating: Double
    let tags: [String]?
}
