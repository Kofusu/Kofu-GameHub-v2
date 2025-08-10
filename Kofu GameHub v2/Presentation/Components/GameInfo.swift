//
//  GameInfo.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 11/08/25.
//

import Foundation
import SwiftUI

struct GameInfo: View {
    let id: Int
    let name: String
    let rating: Double
    let released: Date
    let imageURL: URL?
    
    var disableNavigation: Bool? = false
    
    var body: some View {
        if (disableNavigation!) {
            content
        } else {
            NavigationLink {
                DetailGameView(id: id)
            } label: {
                content
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        HStack {
            if let _ = imageURL {
                ProgressView()
                    .frame(width: 119, height: 67)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.gray)
                    }
            } else {
                Image(systemName: "icloud.slash")
                    .frame(width: 119, height: 67)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.gray)
                    }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(name).font(.customHeading)
                Text("Rating: \(String(rating))").font(.customBody)
                Text("Released: \(released.formatDate())").font(.customBody)
            }
            
            Spacer()
        }
    }
}
