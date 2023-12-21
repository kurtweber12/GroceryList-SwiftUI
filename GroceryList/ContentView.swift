//
//  ContentView.swift
//  GroceryList
//
//  Created by Kurt Weber on 12/20/23.
//

import SwiftUI
import SwiftData

// Model: Data
// Container: Where things are saved
// Context: How you interact

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State var newItemString = ""
    
    @Query var items: [GroceryListItem]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Add Item", text: $newItemString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save") {
                    guard !newItemString.isEmpty else {
                        return
                    }
                    
                    let newItem = GroceryListItem(title: newItemString, subtitle: "Buy this ASAP!!", date: Date())
                    
                    context.insert(newItem)
                    
                    newItemString = ""
                }
                
                List {
                    ForEach(items) { item in
                        VStack {
                            Text(item.title)
                            Text(item.date.formatted())
                        }
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach({ index in
                            context.delete(items[index])
                        })
                    })
                    
                }
                .overlay {
                    if items.isEmpty {
                        Text("No items")
                    }
                }
            } .navigationTitle("Grocery List")
        }
    }
}

#Preview {
    ContentView()
}
