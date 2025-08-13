//
//  LikedGameView.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import SwiftUI
import SwiftData

struct LikedGameView: View {
    @Environment(\.modelContext) private var context
    @StateObject var viewModel: LikedGameViewModel
    @Query var likedGames: [LikedGame]
    
    init() {
        _viewModel = StateObject(wrappedValue: LikedGameViewModel())
    }
    var body: some View {
        ZStack(alignment: .top) {
            Color.darkBlue.ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                MainHeaderApp(hasBackButton: true)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("Likes You've Made").font(.customBody)
                        Spacer()
                        Image("pixel_filter")
                            .icon(17)
                    }
                    
                    ScrollView {
                        LazyVStack(spacing: 32) {
                            ForEach(likedGames) { game in
                                GameInfo(
                                    id: game.id,
                                    name: game.name,
                                    rating: game.rating,
                                    released: game.released,
                                    imageURL: game.imageBackground)
                            }
                        }
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
            viewModel.context? = context
        }
    }
}

#Preview {
    LikedGameView()
}
