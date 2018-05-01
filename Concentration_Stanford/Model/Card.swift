//
//  Card.swift
//  Concentration_Stanford
//
//  Created by Luana on 30/04/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation

struct Card {

    var isFaceUp = false
    var isMatched = false
    var indentifier: Int

    static var identifierFactory = 0

    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.indentifier = Card.getUniqueIdentifier()
    }
}
