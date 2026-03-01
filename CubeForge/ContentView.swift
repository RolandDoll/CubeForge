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

struct CollectionCheckListView: View {
    @State private var acquired: Bool = false
    
    var body: some View {
        VStack {
            Toggle(
                isOn: $acquired, label: {Text("Lightning, Army of One")}).toggleStyle(.button)
        }
        // Checklist

    }
}

#Preview {
    CollectionCheckListView()
}
