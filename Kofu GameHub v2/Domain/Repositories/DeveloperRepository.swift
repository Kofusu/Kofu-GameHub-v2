//
//  DeveloperRepository.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

protocol DeveloperRepository {
    func getDevelopers(limit: Int?, offset: Int?) async throws -> [Developer]
}
