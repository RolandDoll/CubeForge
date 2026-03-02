//
//  ContentView.swift
//  CubeForge
//
//  Created by Roland Doll on 2/28/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

class Card: Identifiable {
    let id = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

private    var lightning = Card(name: "Lightning, Army of One")
private var cid15 = Card(name: "Cid XV")
private var superDuperSephy = Card(name: "Normura Art Sephiroth")

struct CollectionCheckListView: View {
    @State private var acquired: Bool = false
    
    var missingCards = [lightning, cid15, superDuperSephy]
    
    var body: some View {
        VStack {
            List(missingCards) {
                Text($0.name)
            }
        }
        // Checklist

    }
}

#Preview {
    CollectionCheckListView()
}
