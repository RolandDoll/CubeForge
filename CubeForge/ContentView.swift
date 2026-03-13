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
    let baseCount: Int
    
    init(name: String, baseCount: Int) {
        self.name = name
        self.baseCount = baseCount
    }
}

private var lightning = Card(name: "Lightning, Army of One", baseCount: 0)
private var cid15 = Card(name: "Cid XV", baseCount: 0)
private var superDuperSephy = Card(name: "Normura Art Sephiroth (He's very cool)", baseCount: 0)
private var cloive = Card(name: "Clive, Ifrit's Dominant", baseCount: 1)

struct EntryView: View {
    var title: String
    @State var baseCount: Int
    @State private var borderlessAcquired: Bool? = nil
    @State private var showcaseAcquired: Bool? = nil
    
    struct AcquiredDisplay: View {
        @State var baseCount: Int
        var body: some View {
            if (baseCount > 0) {
                Text("Y")
            } else {
                Text("N")
            }
        }};
    
    var body: some View {
        let cubeComplete = baseCount > 4
        
        HStack {
            AcquiredDisplay(baseCount: baseCount)
            cubeComplete ? (Text("Y")) : Text("N")
            Text(title)
        }
        
    }
}

struct CollectionCheckListView: View {
    @State private var acquired: Bool = false
    
    var missingCards = [lightning, cid15, superDuperSephy, cloive]
    
    var body: some View {
        ZStack {
            VStack {
    //            List(missingCards) {
    //                EntryView(title: $0.name, baseCount: $0.baseCount)
    //            }
                CardView(title: lightning.name, color: .yellow)
                CardView(title: cloive.name, color: .red)
            }
        }.background(.gray).padding(16)

        
        
    }
}

struct CardView: View {
    let title: String
    let color: Color
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25).fill(color)
            Text(title)
        }.frame(width: 300, height: 200)
    }
}

#Preview {
    CollectionCheckListView()
//    CardView()
}
