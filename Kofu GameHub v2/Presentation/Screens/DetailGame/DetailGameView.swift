//
//  DetailGameView.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import Foundation
import SwiftUI
import Flow

struct DetailGameView: View {
    @Environment(\.dismiss) var dismiss
    
    let id: Int
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Color.darkBlue.ignoresSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 20) {
                    ZStack(alignment: .topLeading) {
                        if false {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: geo.size.height * 0.3)
                                .background {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(.gray)
                                }
                        } else {
                            Image(systemName: "icloud.slash")
                                .frame(maxWidth: .infinity, maxHeight: geo.size.height * 0.3)
                                .background {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(.gray)
                                }
                        }
                        
                        Button {
                            dismiss()
                        } label: {
                            Image("pixelarticons_arrow-left")
                                .icon()
                                .padding(.top, 10)
                                .padding(.leading, 16)
                        }
                        
                        Button {
                            // TODO: Toggle Liked
                        } label: {
                            Image("pixelarticons_heart")
                                .icon(36)
                                .background {
                                    RoundedRectangle(cornerRadius: 1000)
                                        .fill(.darkCyan)
                                        .frame(width: 64, height: 64, alignment: .center)
                                }
                        }
                        .offset(CGSize(width: geo.size.width - 72, height: geo.size.height * 0.3 - 16))
                    }
                    
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                GameInfo(
                                    id: 1,
                                    name: "Elden Ring",
                                    rating: 4.8,
                                    released: Date(),
                                    imageURL: nil,
                                    disableNavigation: true)
                                
                                Text("Lorem Ipsum")
                                    .font(.customBody)
                            }
                            .container()
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Tags")
                                    .font(.customBody)
                                
                                HFlow(alignment: .top, spacing: 11) {
                                    Text("Fighting").UITag()
                                    Text("Fighting").UITag()
                                    Text("Fighting").UITag()
                                    Text("Fighting").UITag()
                                    Text("Fighting").UITag()
                                    Text("Fighting").UITag()
                                }
                            }
                            .container()
                        }
                    }
                }
            }
            .toolbar(.hidden)
            .foregroundStyle(.lightCyan)
        }
    }
}

#Preview {
    DetailGameView(id: 1)
}
