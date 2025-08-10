//
//  List Game.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import SwiftUI

enum ListGameType {
    case popular
    case newest
}

struct ListGameView: View {
    var listGameType: ListGameType
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.darkBlue.ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                MainHeaderApp(hasBackButton: true)
                
                VStack(spacing: 16) {
                    HStack {
                        Text(listGameType == .popular
                             ? "Popular Games"
                             : "Newest Games"
                        ).font(.customBody)
                        Spacer()
                        Image("pixel_filter")
                            .icon(17)
                    }
                    
                    ScrollView {
                        LazyVStack(spacing: 32) {
                            GameInfo(
                                id: 1,
                                name: "Elden Ring",
                                rating: 4.8,
                                released: Date(),
                                imageURL: nil)
                            GameInfo(
                                id: 1,
                                name: "Elden Ring",
                                rating: 4.8,
                                released: Date(),
                                imageURL: nil)
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
    }
}

#Preview {
    ListGameView(listGameType: .popular)
}
