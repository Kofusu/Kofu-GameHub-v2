//
//  TagRepository.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 08/08/25.
//

import Foundation

public protocol TagRepository {
    func getTags(limit: Int?, offset: Int?) async throws -> [TagEntity]
}
