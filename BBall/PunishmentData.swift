//
//  PunishmentData.swift
//  BBall
//
//  Created by Jacob Myers on 4/16/20.
//  Copyright © 2020 Jacob Myers. All rights reserved.
//

import Foundation
class PunishmentData {
    var punishmentChangeMap: [String: Int]
    init (punishmentMap: [String: Int]) {
        self.punishmentChangeMap = punishmentMap
    }
    
    func getPunishmentPercentageMap() -> [String: Int] {
        var punishmentPercentageDenom: Int = 0
        var punishmentPercentageMap:[String: Int] = [:]
        
        // Get the total count for denominator of percentage
        for element in punishmentChangeMap {
            punishmentPercentageDenom += element.value
        }
        
        // Calculate their percent chance, add it to a new map
        for element in punishmentChangeMap {
            let percentage = Int(Double(element.value) / Double(punishmentPercentageDenom) * 100)
            punishmentPercentageMap[element.key] = percentage
        }
        return punishmentPercentageMap
    }
}
