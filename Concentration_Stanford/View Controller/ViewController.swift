//
//  ViewController.swift
//  Concentration_Stanford
//
//  Created by Luana on 30/04/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Instance Properties
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)

    // MARK: - Outlets
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    // MARK: - Actions
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        guard let cardNumber = cardButtons.index(of: sender) else { return }
        game.chooseCard(at: cardNumber)
        updateView()
    }

    // MARK: - Methods
    func updateView() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }

    var emojiChoises = ["🎃", "👻", "💀", "🧟‍♀️", "🧛🏻‍♀️", "🧙🏽‍♂️", "🍬", "🙀"]
    var emoji = [Int : String]()

    func emoji(for card: Card) -> String {
        if emoji[card.indentifier] == nil, emojiChoises.count > 0 {
        let randomIndex = Int(arc4random_uniform(UInt32(emoji.count)))
            emoji[card.indentifier] = emojiChoises.remove(at: randomIndex)
        }
        return emoji[card.indentifier] ?? "?"
    }

}

