//
//  SearchHeaderApp.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 11/08/25.
//

import Foundation
import SwiftUI

struct SearchHeaderApp: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var searchText: String
    
    
    var body: some View {
        HStack {
            
            Button {
                dismiss()
            } label: {
                Image("pixelarticons_arrow-left")
                    .icon()
            }
            
            
            TextField(text: $searchText) {
                Text("Search Games")
                    .foregroundStyle(.lightCyan)
                    .font(.customBody)
            }
            .submitLabel(.search)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.darkBlue)
            }
            .font(.customBody)
            
            Spacer()
        }
        .container()
        .padding(.bottom, 12)
        .background(.darkCyan)
        .foregroundStyle(.lightCyan)
    }
}
