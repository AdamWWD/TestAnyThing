//
//  ViewController_Standford_L1.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/11/22.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_Standford_L2: UIViewController {
    
    private lazy var game:Concentration =
        Concentration(numberOfPairsOfCards: self.numberOfPairsOfCards)
    
    var numberOfPairsOfCards:Int {
        return(self.cardButtons.count + 1) / 2
    }
    

    private(set) var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen car was not in cardButtons")
        }
        
    }
    
    private func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
            print(cardButtons.count)
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
        }
    }
    
    private var emojiChoices = ["🦇","😱", "🙀", "👿", "🎃", "👻", "🍭", "🍬","🍎"]
    
    private var emoji = [Int:String]()

    private func emoji(for card: Card) ->String
    {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }

    func flipCard(withEmoji emoji: String, on button: UIButton)
    {
        print("flipCard(withEmoji: \(emoji))")
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else
        {
            button.setTitle(emoji, for:UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

