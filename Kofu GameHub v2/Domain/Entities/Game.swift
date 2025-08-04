//
//  Game.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

struct Game: Identifiable {
    let id: Int
    let name: String
    let released: Date?
    let backgroundImage: URL?
    let rating: Double
    let updated: Date?
}
