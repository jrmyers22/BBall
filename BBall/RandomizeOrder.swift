//
//  RandomizeOrder.swift
//  BBall
//
//  Created by Jacob Myers on 4/16/20.
//  Copyright © 2020 Jacob Myers. All rights reserved.
//

import Foundation
class RandomizeOrder {
    var items: [String]
    let limit: Int
    init(items: [String], limit: Int = 0) {
        self.items = items
        self.limit = limit
    }
    
    func getRandom() -> [String] {
        if limit != 0 {
          let randomInt = Int.random(in: 0..<self.items.count)
          return Array([self.items[randomInt]])
        }
        var shuffled: [String] = []
        while (shuffled.count != self.items.count) {
            let randomInt = Int.random(in: 0..<self.items.count)
            if (!shuffled.contains(self.items[randomInt])) {
                shuffled.append(self.items[randomInt])
            }
        }
        return shuffled
    }
}
