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


// Probably going to need a grid here.
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

var darkPurple = Color(#colorLiteral(red: 0.157, green: 0.063, blue: 0.306, alpha: 1)) // #28104e
var mediumPurple = Color(#colorLiteral(red: 0.388, green: 0.153, blue: 0.627, alpha: 1)) // #6327a0
var lightPurple = Color(#colorLiteral(red: 0.592, green: 0.271, blue: 0.796, alpha: 1)) // #9745cb
var cardColor = Color(#colorLiteral(red: 0.871, green: 0.675, blue: 0.961, alpha: 1)) // #deacf5


// Manipulate root of ZStakc for app wide background color? Who knows how flexible that actually is though
// meh, fuck it we ball. EA- it's in the game.
struct CollectionCheckListView: View {
    @State private var acquired: Bool = false
    
    var missingCards = [lightning, cid15, superDuperSephy, cloive]
    
    var bg = LinearGradient(colors:[darkPurple, mediumPurple, lightPurple], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    var body: some View {
        ZStack {
            bg
            VStack {
    //            List(missingCards) {
    //                EntryView(title: $0.name, baseCount: $0.baseCount)
    //            }
                CardView(title: lightning.name, color: .yellow, count: lightning.baseCount)
                CardView(title: cloive.name, color: .red, count: cloive.baseCount)
            }
        }.ignoresSafeArea()
    }
}

struct CardView: View {
    let title: String
    let color: Color
    let count: Int
    
    
//    Probably
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25).fill(cardColor)
            HStack {
                Text("\(count)/5")
                Text(title)
            }
        }.frame(width: 350, height: 100)
    }
}

#Preview {
    CollectionCheckListView()
//    CardView()
}
