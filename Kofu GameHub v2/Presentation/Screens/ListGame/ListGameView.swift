//
//  List Game.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import SwiftUI

struct ListGameView: View {
    @StateObject var viewModel: ListGameViewModel
    init(listGameType: ListGameType) {
        _viewModel = StateObject(wrappedValue:
                                    ListGameViewModel(listGameType: listGameType,
                                                      getNewestGameUseCase: GetNewestGameUseCaseImpl(
                                                        repository: GameRepositoryImpl(
                                                            client: GameAPIClient()
                                                        )
                                                      ),
                                                      getPopularGameUseCase: GetPopularGameUseCaseImpl(
                                                        repository: GameRepositoryImpl(
                                                            client: GameAPIClient()
                                                        )
                                                      )
                                                     )
        )
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.darkBlue.ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                MainHeaderApp(hasBackButton: true)
                
                VStack(spacing: 16) {
                    HStack {
                        Text(viewModel.listGameType == .popular
                             ? "Popular Games"
                             : "Newest Games"
                        ).font(.customBody)
                        Spacer()
                        Image("pixel_filter")
                            .icon(17)
                    }
                    
                    ScrollView {
                        LazyVStack(spacing: 32) {
                            if viewModel.isLoading {
                                GameInfo(
                                    id: 0,
                                    name: "...",
                                    rating: 0,
                                    released: nil,
                                    imageURL: nil,
                                disableNavigation: true)
                            } else {
                                ForEach(viewModel.games) { game in
                                    GameInfo(
                                        id: game.id,
                                        name: game.name,
                                        rating: game.rating,
                                        released: game.released,
                                        imageURL: game.backgroundImage)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                }
                .container()
                .padding(.top, 14)
            }
            
            Spacer()
        }
        .toolbar(.hidden)
        .foregroundStyle(.lightCyan)
        .task {
            await viewModel.loadData()
        }
    }
}

#Preview {
    ListGameView(listGameType: .popular)
}
