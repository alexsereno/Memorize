//
//  File.swift
//  Memorize
//
//  Created by Alexander Sereno on 5/24/20.
//  Copyright © 2020 Alexander Sereno. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    //mark as private to ensure that only emojimemgame can modify
    //private(set) allows other classes to see the var's contents but not modify - a "glass door", otherwise it's a "closed door"
    //_ just means "i don't care what this is since it won't be referenced later
    
    @Published private var gameModel: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    //static funcs sets the function to be on the type instead of on the instance
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🐇","🌸", "🌱", "💐", "🌻"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    //as an alternative to private set, just create a var that stores a copy of the model so that anything can use safely
    var cards: Array<MemoryGame<String>.Card> {
        gameModel.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        gameModel.choose(card: card)
    }
}
