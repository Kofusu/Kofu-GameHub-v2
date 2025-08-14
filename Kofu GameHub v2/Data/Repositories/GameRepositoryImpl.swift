//
//  GameRepositoryImpl.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 05/08/25.
//

import Foundation

final class GameRepositoryImpl: GameRepository {
    var client: GameAPIClient
    
    init(client: GameAPIClient = .init()) {
        self.client = client
    }
    
    func getPopularGames(limit: Int? = 10, offset: Int? = 0) async throws -> [Game] {
        let dtos = try await client.fetchPopularGames(limit: limit, offset: offset)
        return dtos.map { $0.toEntity() }
    }
    
    func getNewestGames(limit: Int? = 10, offset: Int? = 0) async throws -> [Game] {
        let dtos = try await client.fetchNewestGames(limit: limit, offset: offset)
        return dtos.map { $0.toEntity() }
    }
    
    func searchGames(query: String) async throws -> [Game] {
        let dtos = try await client.fetchSearchGames(query: query)
        return dtos.map { $0.toEntity() }
    }
    
    func getDetailGame(id: Int) async throws -> DetailGame {
        let dtos = try await client.fetchDetailGames(id: id)
        return dtos.toEntity()
    }
}
