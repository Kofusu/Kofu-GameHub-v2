//
//  ContentView.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 01/08/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        Text("Hello World!")
    }
}

#Preview {
    HomeView()
        .modelContainer(for: Item.self, inMemory: true)
}
