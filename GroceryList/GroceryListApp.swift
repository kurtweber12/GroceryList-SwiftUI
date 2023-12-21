//
//  GroceryListApp.swift
//  GroceryList
//
//  Created by Kurt Weber on 12/20/23.
//

import SwiftUI
import SwiftData

@main
struct GroceryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: GroceryListItem.self)
    }
}
