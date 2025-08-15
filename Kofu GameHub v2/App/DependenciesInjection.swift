//
//  DependenciesInjection.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 13/08/25.
//

import Foundation
import Swinject
import Core

final class AppDIContainer {
    static let shared = AppDIContainer()
    let container = Container()
    
    private init() {
        registerServices()
    }
    
    private func registerServices() {
        // MARK: - API Clients
        container.register(TagAPIClient.self) { _ in
            TagAPIClient()
        }
        
        container.register(TagRepository.self) { r in
            TagRepositoryImpl(client: r.resolve(TagAPIClient.self)!)
        }
        
        container.register(GetTagsUseCase.self) { r in
            GetTagUseCaseImpl(repository: r.resolve(TagRepository.self)!)
        }
        
        // MARK: - Developer
        container.register(DeveloperAPIClient.self) { _ in
            DeveloperAPIClient()
        }
        container.register(DeveloperRepository.self) { r in
            DeveloperRepositoryImpl(client: r.resolve(DeveloperAPIClient.self)!)
        }
        container.register(GetDevelopersUseCase.self) { r in
            GetDevelopersUseCaseImpl(repository: r.resolve(DeveloperRepository.self)!)
        }
        
        // MARK: - Platform
        container.register(PlatformAPIClient.self) { _ in
            PlatformAPIClient()
        }
        container.register(PlatformRepository.self) { r in
            PlatformRepositoryImpl(client: r.resolve(PlatformAPIClient.self)!)
        }
        container.register(GetPlatformsUseCase.self) { r in
            GetPlatformsUseCaseImpl(repository: r.resolve(PlatformRepository.self)!)
        }
        
        // MARK: - Game
        container.register(GameAPIClient.self) { _ in
            GameAPIClient()
        }
        container.register(GameRepository.self) { r in
            GameRepositoryImpl(client: r.resolve(GameAPIClient.self)!)
        }
        container.register(GetPopularGameUseCase.self) { r in
            GetPopularGameUseCaseImpl(repository: r.resolve(GameRepository.self)!)
        }
        container.register(GetNewestGameUseCase.self) { r in
            GetNewestGameUseCaseImpl(repository: r.resolve(GameRepository.self)!)
        }
        
        // MARK: - Home View Model
        container.register(HomeViewModel.self) { r in
            MainActor.assumeIsolated {
                HomeViewModel(
                    getTagsUseCase:        r.resolve(GetTagsUseCase.self)!,
                    getDevelopersUseCase:  r.resolve(GetDevelopersUseCase.self)!,
                    getPlatformUseCase:    r.resolve(GetPlatformsUseCase.self)!,
                    getPopularGameUseCase: r.resolve(GetPopularGameUseCase.self)!,
                    getNewestGameUseCase:  r.resolve(GetNewestGameUseCase.self)!
                )
            }
        }
        
    }
}
