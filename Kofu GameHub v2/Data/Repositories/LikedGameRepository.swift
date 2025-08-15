//
//  LikedGameRepository.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 13/08/25.
//

import Foundation
import SwiftData
import Core

final class LikedGameRepository {
    private let context: ModelContext
    
    init (context: ModelContext) {
        self.context = context
    }
    
    func add (_ game: Game) {
        let likedGame = LikedGame(id: game.id, name: game.name, imageBackground: game.backgroundImage, released: game.released, rating: game.rating)
        context.insert(likedGame)
        
        save()
    }
    
    func getAll () -> [LikedGame]? {
        do {
            return try context.fetch(FetchDescriptor<LikedGame>())
        } catch {
            print(error.localizedDescription)
            
            return nil
        }
    }
    
    func getById(_ id: Int) -> LikedGame? {
        do {
            let predicate = #Predicate<LikedGame> { $0.id == id }
            let descriptor = FetchDescriptor<LikedGame>(predicate: predicate)
            return try context.fetch(descriptor).first
        } catch {
            print("❌ Failed to fetch liked game by id: \(error)")
            return nil
        }
    }
    
    
    func update(_ likedGame: LikedGame, newGame: Game) {
        likedGame.id = newGame.id
        likedGame.name = newGame.name
        likedGame.imageBackground = newGame.backgroundImage
        likedGame.released = newGame.released
        likedGame.rating = newGame.rating
        
        save()
    }
    
    func delete(_ likedGame: LikedGame) {
        context.delete(likedGame)
        save()
    }
    
    func save () {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
