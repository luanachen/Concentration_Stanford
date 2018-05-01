//
//  Concentration.swift
//  Concentration_Stanford
//
//  Created by Luana on 30/04/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import Foundation


class Concentration  {

    var cards = [Card]()

    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card( )
            cards += [card, card]
        }

        // TODO: Shuffle the cards

        // TODO: New game button
        
    }

    var  indexOfOneAndOnlyFaceUpCard: Int?

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].indentifier == cards[index].indentifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // eiter no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

}
