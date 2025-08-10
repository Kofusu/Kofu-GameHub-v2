//
//  ContentView.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 01/08/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue:
                                    HomeViewModel(
                                        getTagsUseCase: GetTagUseCaseImpl(
                                            repository: TagRepositoryImpl(
                                                client: TagAPIClient()
                                            )
                                        ),
                                        getDevelopersUseCase: GetDevelopersUseCaseImpl(
                                            repository: DeveloperRepositoryImpl(
                                                client: DeveloperAPIClient()
                                            )
                                        ),
                                        getPlatformUseCase: GetPlatformsUseCaseImpl(
                                            repository: PlatformRepositoryImpl(
                                                client: PlatformAPIClient()
                                            )
                                        ),
                                        getPopularGameUseCase: GetPopularGameUseCaseImpl(
                                            repository: GameRepositoryImpl(
                                                client: GameAPIClient()
                                            )
                                        ),
                                        getNewestGameUseCase: GetNewestGameUseCaseImpl(
                                            repository: GameRepositoryImpl(
                                                client: GameAPIClient()
                                            )
                                        ),
                                    )
        )
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                MainHeaderApp()
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        ListCategory
                        ListPlatform
                        ListPopularGame
                        ListNewestGame
                        ListDeveloper
                    }
                    .padding(.top, 26.5)
                }
            }
            .scrollIndicators(.hidden)
            .background(.darkBlue)
            .task {
                await viewModel.loadData()
            }
        }
    }
    
    @ViewBuilder
    var ListCategory: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 14) {
                if viewModel.isLoading {
                    ForEach(0..<10, id: \.self) { _ in
                        Text(".........").UITag()
                    }
                } else {
                    ForEach(viewModel.tags) { tag in
                        Text(tag.name).UITag()
                    }
                }
            }
            .container()
        }
        .scrollIndicators(.hidden)
    }
    
    @ViewBuilder
    var ListPlatform: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Platforms")
                    .font(.customBody)
                
                Spacer()
            }
            .container()
            
            ScrollView(.horizontal) {
                HStack(spacing: 14) {
                    if viewModel.isLoading {
                        PlatformCard(image: nil, title: "......")
                        PlatformCard(image: nil, title: "......")
                        PlatformCard(image: nil, title: "......")
                        PlatformCard(image: nil, title: "......")
                        PlatformCard(image: nil, title: "......")
                    } else {
                        ForEach(viewModel.platforms) { platform in
                            PlatformCard(image: platform.imageBackground, title: platform.name)
                        }
                    }
                    
                }
                .container()
            }
        }
        .foregroundStyle(.lightCyan)
    }
    
    @ViewBuilder
    var ListPopularGame: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Popular Games")
                    .font(.customBody)
                Spacer()
                NavigationLink {
                    ListGameView(listGameType: .popular)
                } label: {
                    Image("pixel_angle-right-solid")
                        .icon(17)
                }
            }
            .container()
            
            ScrollView(.horizontal) {
                HStack(spacing: 14) {
                    if viewModel.isLoading {
                        GameCard(id: 0, name: ".....", image: nil, rating: 0)
                        GameCard(id: 0, name: ".....", image: nil, rating: 0)
                        GameCard(id: 0, name: ".....", image: nil, rating: 0)
                    } else {
                        ForEach(viewModel.popularGames) { game in
                            GameCard(id: game.id, name: game.name, image:game.backgroundImage, rating: game.rating)
                        }
                    }
                }
                .container()
            }
        }
        .foregroundStyle(.lightCyan)
    }
    
    @ViewBuilder
    var ListNewestGame: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Newest Game")
                    .font(.customBody)
                
                Spacer()
                NavigationLink {
                    ListGameView(listGameType: .newest)
                } label: {
                    Image("pixel_angle-right-solid")
                        .icon(17)
                }
            }
            .container()
            
            ScrollView(.horizontal) {
                HStack(spacing: 14) {
                    if viewModel.isLoading {
                        GameCard(id: 0, name: ".....", image: nil, rating: 0)
                        GameCard(id: 0, name: ".....", image: nil, rating: 0)
                        GameCard(id: 0, name: ".....", image: nil, rating: 0)
                    } else {
                        ForEach(viewModel.newestGames) { game in
                            GameCard(id: game.id, name: game.name, image:game.backgroundImage, rating: game.rating)
                        }
                    }
                }
                .container()
            }
        }
        .foregroundStyle(.lightCyan)
    }
    
    @ViewBuilder
    var ListDeveloper: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Top Developers")
                    .font(.customBody)
                
                Spacer()
            }
            .container()
            
            ScrollView {
                VStack(spacing: 11) {
                    if viewModel.isLoading {
                        DeveloperCard(id: 0, name: "......", gamesCount: 0, image: nil)
                        DeveloperCard(id: 0, name: "......", gamesCount: 0, image: nil)
                        DeveloperCard(id: 0, name: "......", gamesCount: 0, image: nil)
                    } else {
                        ForEach(viewModel.developers) { developer in
                            DeveloperCard(id: developer.id, name: developer.name, gamesCount: developer.gamesCount, image: developer.imageBackground)
                        }
                    }
                }
                .container()
            }
        }
        .foregroundStyle(.lightCyan)
    }
}

#Preview {
    HomeView()
        .modelContainer(for: [LikedGame.self], inMemory: true)
}
