//
//  RandomizeOrder.swift
//  BBall
//
//  Created by Jacob Myers on 4/16/20.
//  Copyright © 2020 Jacob Myers. All rights reserved.
//

import Foundation
class RandomizeOrder {
    var roommates: [String]
    var fullMap: [String:Int]
    
    init(roommates: [String] = [], fullMap: [String:Int] = [:]) {
        self.roommates = roommates
        self.fullMap = fullMap
    }
    
    func getRandom() -> [String] {
        print("Get Random")
        if roommates.count == 0 {
            print("Getting a random single punishment")
            // Just return a single random punishment
            
            // First need to create a datastructure with the correct number of elements in there
            var extendedPunishmentsList: [String] = []
            for element in self.fullMap { // iterate through each element in the map
                for _ in 1...element.value { // uses _ because the value is never used, iterate 1-value and add the key
                    extendedPunishmentsList.append(element.key)
                }
            }
            print(extendedPunishmentsList.count)
            print(extendedPunishmentsList)
            
            // Then randomize the selection, return a 1 element long list to conform to the return type
            let randomInt = Int.random(in: 0..<extendedPunishmentsList.count)
            print(randomInt)
            print(extendedPunishmentsList[randomInt])
            return Array([extendedPunishmentsList[randomInt]])
        }
        var shuffled: [String] = []
        if roommates.count > 0 {
            while (shuffled.count != self.roommates.count) {
                let randomInt = Int.random(in: 0..<self.roommates.count)
                if (!shuffled.contains(self.roommates[randomInt])) {
                    shuffled.append(self.roommates[randomInt])
                }
            }
        }
        return shuffled
    }
}
