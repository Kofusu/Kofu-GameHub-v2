//
//  ContentView.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 01/08/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
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
        }
    }
    
    @ViewBuilder
    var ListCategory: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 14) {
                Text("Sports").UITag()
                Text("Simulator").UITag()
                Text("Multiplayer").UITag()
                Text("Strategy").UITag()
                Text("Etc.").UITag()
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
                    PlatformCard(image: nil, title: "Title")
                    PlatformCard(image: nil, title: "Title")
                    PlatformCard(image: nil, title: "Title")
                    PlatformCard(image: nil, title: "Title")
                    PlatformCard(image: nil, title: "Title")
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
                    GameCard(id: 1, name: "Name", image: nil, rating: 4.0)
                    GameCard(id: 1, name: "Name", image: nil, rating: 4.0)
                    GameCard(id: 1, name: "Name", image: nil, rating: 4.0)
                    GameCard(id: 1, name: "Name", image: nil, rating: 4.0)
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
                    GameCard(id: 1, name: "Name", image: nil, rating: 4.0)
                    GameCard(id: 1, name: "Name", image: nil, rating: 4.0)
                    GameCard(id: 1, name: "Name", image: nil, rating: 4.0)
                    GameCard(id: 1, name: "Name", image: nil, rating: 4.0)
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
                    DeveloperCard(id: 1, name: "From Software", gamesCount: 12, image: nil)
                    DeveloperCard(id: 1, name: "From Software", gamesCount: 12, image: nil)
                    DeveloperCard(id: 1, name: "From Software", gamesCount: 12, image: nil)
                    DeveloperCard(id: 1, name: "From Software", gamesCount: 12, image: nil)
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
