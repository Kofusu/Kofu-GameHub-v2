//
//  TagDTO.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 08/08/25.
//

import Foundation
import Core

struct TagListResponse: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [TagDTO]

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decode(Int.self, forKey: .count)
        results = try container.decode([TagDTO].self, forKey: .results)

        if let nextString = try container.decodeIfPresent(String.self, forKey: .next),
           let url = URL(string: nextString), !nextString.isEmpty {
            next = url
        } else {
            next = nil
        }

        if let prevString = try container.decodeIfPresent(String.self, forKey: .previous),
           let url = URL(string: prevString), !prevString.isEmpty {
            previous = url
        } else {
            previous = nil
        }
    }
}

struct TagDTO: Identifiable, Codable {
    let id: Int
    let name: String
    let slug: String
    let gamesCount: Int
    let imageBackground: URL?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        slug = try container.decode(String.self, forKey: .slug)
        gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount) ?? 0

        if let imgString = try container.decodeIfPresent(String.self, forKey: .imageBackground),
           let url = URL(string: imgString), !imgString.isEmpty {
            imageBackground = url
        } else {
            imageBackground = nil
        }
    }

    func toEntity() -> TagEntity {
        TagEntity(id: id, name: name)
    }
}
