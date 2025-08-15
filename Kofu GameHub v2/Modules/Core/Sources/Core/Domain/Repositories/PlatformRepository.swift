//
//  PlatformRepository.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

public protocol PlatformRepository {
    func getPlatforms(limit: Int?, offset: Int?) async throws -> [Platform]
}
