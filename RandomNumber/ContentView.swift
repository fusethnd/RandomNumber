//
//  ContentView.swift
//  RandomNumber
//
//  Created by Thanadon Boontawee on 19/1/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess: Double = 0.0
    @State var showResult = false
    
    var body: some View {
        VStack {
            // Double(game.target.random)
            // Blind Number
            
            Text("Guess me what I am?")
            VStack {
                Text("Guess a number :)")
                    .font(.headline)
                Text("Round \(game.count)")
            }.padding()
            
//            Text(String(Game.target))
//                .font(.largeTitle)
            // Int(guess.Int)
            
            Text(String(Game.toint(val: guess)))
                 
            HStack {
                Text("0")
                Slider(value: $guess)
                Text("100")
            }
            
            Button("Guess!!!") {
                showResult = true
                game.check(guess: guess)
            }.padding()
            .alert(isPresented: $showResult) {
                Alert(
                    title: Text("Your result"),
                    message: Text(game.text),
                    dismissButton: .default(Text("OK")) {
                        if game.correct {
                            guess = 0
                            game.startNewGame()
                        }
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
