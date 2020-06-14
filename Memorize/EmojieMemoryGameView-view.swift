//
//  ContentView.swift
//  Memorize
//
//  Created by Alexander Sereno on 5/24/20.
//  Copyright © 2020 Alexander Sereno. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var gameViewModel: EmojiMemoryGame
    //curly braces mean the internal value is computed
    var body: some View {
        //there is an implicit "return" in all one line {}
        //return Text("")
        
        //HStach - stacks horizontally, has default spacing between stacks
        HStack {
            //foreach takes an iteror - ideally a list, and creates views for each lul
            ForEach(gameViewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    self.gameViewModel.choose(card: card)}
            }
            .aspectRatio(2/3, contentMode: .fit)

        }
            //applying a function to the Z stack applies to all contained views
        //you can ovverride inherited functions contained views
            .foregroundColor(Color.pink)
            .padding()
            .font(gameViewModel.cards.count < 10 ? Font.largeTitle : Font.body)
    }
}



struct CardView: View {
    var card:MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                //inherting color from Z-stack
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(gameViewModel: EmojiMemoryGame())
    }
}
