//
//  Platform.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

public struct Platform: Identifiable {
    public let id: Int
    public let name: String
    public let gamesCount: Int
    public let imageBackground: URL?
    public let image: URL?
    
    public init(id: Int, name: String, gamesCount: Int, imageBackground: URL?, image: URL?) {
        self.id = id
        self.name = name
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
        self.image = image
    }
}
