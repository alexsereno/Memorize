//
//  ContentView.swift
//  Memorize
//
//  Created by Alexander Sereno on 5/24/20.
//  Copyright © 2020 Alexander Sereno. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //curly braces mean the internal value is computed
    var body: some View {
        //there is an implicit "return" in all one line {}
        //return Text("")
        
        //HStach - stacks horizontally, has default spacing between stacks
        HStack {
            //foreach takes an iteror - ideally a list, and creates views for each lul
            ForEach(0..<4) { _ in
                CardView(isFaceUp: false)
            }
        }
            //applying a function to the Z stack applies to all contained views
            //you can ovverride inherited functions contained views
            .foregroundColor(Color.orange)
            .padding()
            .font(Font.largeTitle)
    }
}



struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                //inherting color from Z-stack
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
