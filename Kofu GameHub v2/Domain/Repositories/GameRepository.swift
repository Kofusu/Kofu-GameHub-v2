//
//  GameRepository.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 02/08/25.
//

import Foundation

protocol GameRepository {
    func getPopularGames(limit: Int?, offset: Int?) async throws -> [Game]
    func getNewestGames(limit: Int?, offset: Int?) async throws -> [Game]
    func searchGames(query: String) async throws -> [Game]
    func getDetailGame(id: Int) async throws -> DetailGame
}
