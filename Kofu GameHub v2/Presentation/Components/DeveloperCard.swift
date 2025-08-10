//
//  DeveloperCard.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 09/08/25.
//

import Foundation
import SwiftUI

struct DeveloperCard: View {
    let id: Int
    let name: String
    let gamesCount: Int
    let image: URL?
    
    var body: some View {
        HStack(alignment: .top, spacing: 11) {
            if let img = image {
                ProgressView()
                    .frame(width: 128, height: 72)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.gray)
                    }
            } else {
                Image(systemName: "icloud.slash")
                    .frame(width: 128, height: 72)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.gray)
                    }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(name)
                    .font(.customBody)
                Text("\(gamesCount) Games")
                    .font(.customBody)
            }
        }
    }
}
