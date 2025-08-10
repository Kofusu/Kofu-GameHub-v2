//
//  MainHeaderApp.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 07/08/25.
//

import Foundation
import SwiftUI

struct MainHeaderApp: View {
    @Environment(\.dismiss) var dismiss
    
    @State var isConfirmationPresented = false
    
    var hasBackButton: Bool = false
    
    var body: some View {
        HStack {
            if (hasBackButton) {
                Button {
                    dismiss()
                } label: {
                    Image("pixelarticons_arrow-left")
                        .icon()
                }
            } else {
                Button {
                    isConfirmationPresented.toggle()
                } label: {
                    Image("pixel_bars")
                        .icon()
                }
            }
            
            Spacer()
            Text(APP_NAME)
                .font(.customBody)
            Spacer()
            NavigationLink {
                SearchGameView()
            } label: {
                Image("pixel_search")
                    .icon()
            }
            
        }
        .container()
        .padding(.bottom, 12)
        .background(.darkCyan)
        .foregroundStyle(.lightCyan)
        .confirmationDialog("Menu",
                            isPresented: $isConfirmationPresented, titleVisibility: .hidden) {
            NavigationLink {
                ProfileView()
            } label: {
                Text("Profile")
            }
            NavigationLink {
                LikedGameView()
            } label: {
                Text("Likes You've Made")
            }
        }
    }
}
