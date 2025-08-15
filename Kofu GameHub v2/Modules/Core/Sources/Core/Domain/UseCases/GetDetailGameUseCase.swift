//
//  GetDetailGameUseCase.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

public protocol GetDetailGameUseCase {
    func execute(id: Int) async throws -> DetailGame
}

public final class GetDetailGameUseCaseImpl: GetDetailGameUseCase {
    public var repository: GameRepository
    
    public init(repository: GameRepository) {
        self.repository = repository
    }
    
    public func execute(id: Int) async throws -> DetailGame {
        try await repository.getDetailGame(id: id)
    }
}
