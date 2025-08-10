//
//  SearchView.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import SwiftUI

struct SearchGameView: View {
    @State var searchtext = ""
    var body: some View {
        ZStack(alignment: .top) {
            Color.darkBlue.ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                SearchHeaderApp(searchText: $searchtext)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("Search For: ...").font(.customBody)
                        Spacer()
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
    SearchGameView()
}
