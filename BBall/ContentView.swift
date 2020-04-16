//
//  ContentView.swift
//  BBall
//
//  Created by Jacob Myers on 4/15/20.
//  Copyright © 2020 Jacob Myers. All rights reserved.
//

import SwiftUI

let punishments = [
    "Loser: Can't wear shoes for a day":8,
    "Loser: Shower fully clothed":8,
    "Loser: Buys cookout tray for winner":8,
    "Loser: Wear onesie for full class day":4,
    "Loser: 4 others pick out an outfit from Goodwill for them to wear for a day":8,
    "Loser: Personal":7,
    "Loser: Wax your chest":2,
    "Loser: If a roommate calls you must get someone around you to film you doing 20 pushups - limit 2/day for a 5 day week":2,
    "Loser: Wear Abbey's choker for a day":8,
    "Loser: Eat a hot pepper":8,
    "Loser: Winner leads loser on a leash at a dog park until another dog accepts them as one of their own (dog cone optional)":2,
    "Loser: The neighbor/milk one":8,
    "Loser: Chapel Hill is better, change my mind (in the brickyard)":8,
    "Loser: Silent library style embarrassing music":8,
    "Loser: Lemonade stand":8,
    "First two losers: Have to hold hands any time they are in public together for a day":2,
    "First two losers: Handcuffed for a Saturday or Sunday (fuzzy cuffs optional)":4,
    "Four Losers: Buy a case of beer":4,
    "Four Losers: Buy a bottle of winner's favorite liquor":8,
    "Four Losers: Same Night - Jump into lake Raleigh/Johnson (after dark)":4,
    "Winner: 5 star all losers":2,
    "Winner: Laundry done for them for 2 weeks":3,
    "Winner: Takes one personal item from loser's room for a week":8
]

var order: [String] = []
var randomPunishment: String = ""

struct ContentView: View {
    
    @State private var displayAllPunishments: Bool = false
    @State private var displayNewGame: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    
                    // New Game
                    Button(action: {
                        // What to perform
                        let randomizeOrder = RandomizeOrder(items: ["Jacob","Tatlock","Brennen","Feddy","Ani"])
                        order = randomizeOrder.getRandom()
                        self.displayNewGame = true
                        print("New Game pushed")
                    }) {
                        // How the button looks
                        Text("New Game")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding(10)
                        .border(Color.blue, width: 5)
                    }.sheet(isPresented: $displayNewGame, content: {
                        NewGameView()
                    })
                    
                    Divider()
                    
                    // View List of Punishments
                    Button(action: {
                        // What to perform
                        self.displayAllPunishments = true
                        print("View List of Punishments pushed")
                    }) {
                        // How the button looks
                        Text("View All Punishments")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .padding(10)
                        .border(Color.red, width: 5)
                    }.sheet(isPresented: $displayAllPunishments, content: {
                        AllPunishmentsView()
                    })
                    
                    Divider()
                    
                    // View Game Stats
                    Button(action: {
                        // What to perform
                        print("Game stats pushed")
                    }) {
                        // How the button looks
                        Text("Game Stats")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .padding(10)
                        .border(Color.green, width: 5)
                    }
                }
            }
            .navigationBarTitle(Text("BBall"))
        }
    }
}

struct NewGameView: View {
    @State var showPunishment: Bool = false
    
    var body: some View {
        ScrollView(.vertical) {
            if showPunishment {
                PunishmentView()
            } else {
                VStack {
                    Section (header: Text("Order").fontWeight(.bold).font(.title)){
                        ForEach(0..<order.count) {
                            Text(order[$0])
                                .font(.title)
                                .padding()
                                .background(Color.clear)
                                .foregroundColor(.black)
                                .padding(5)
                                .border(Color.gray, width: 3)
                        }
                    }
                }.padding()
                
                Divider()
                
                Button(action: {
                    // What to perform
                    // TODO: Need to create a new data structure with the correct amount of keys in there according to values
                    let randomizePunishments = RandomizeOrder(items: punishments.keys.sorted())
                    randomPunishment = randomizePunishments.getRandom()[0]
                    self.showPunishment = true
                    print("View Current Punishment")
                }) {
                    // How the button looks
                    Text("View Punishment")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct PunishmentView: View {
    var body: some View {
        Text(randomPunishment)
        .font(.title)
        .padding()
        .background(Color.red)
        .foregroundColor(.white)
        .padding(75)
    }
}

struct AllPunishmentsView: View {
    let punishmentKeys = punishments.keys.sorted()
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach (0..<punishmentKeys.count) {
                    Text(self.punishmentKeys[$0])
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .padding(10)
                }
            }.padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
