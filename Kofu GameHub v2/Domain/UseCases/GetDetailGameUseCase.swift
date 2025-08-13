//
//  GetDetailGameUseCase.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

protocol GetDetailGameUseCase {
    func execute(id: Int) async throws -> DetailGame
}

final class GetDetailGameUseCaseImpl: GetDetailGameUseCase {
    var repository: GameRepository
    
    init(repository: GameRepository) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> DetailGame {
        try await repository.getDetailGame(id: id)
    }
}
