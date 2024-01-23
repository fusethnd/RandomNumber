//
//  ContentView.swift
//  RandomNumber
//
//  Created by Thanadon Boontawee on 19/1/2567 BE.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

struct ContentView: View {
    @State var game = Game()
    @State var guess: Double = 0.0
    @State var showResult = false
    
//    private var customFont: Font {
//            Font.custom("Fredoka-Regular", size: 20)
//    }
    
    var body: some View {
        ZStack {
            Color(hex: 0xFFD524)
            
            VStack {
                Text("Hello, world!")
                    // .font(customFont)
                    .background(Color(hex: 0xFFD524))
                
                Text("Guess me what I am?")
                VStack {
                    Text("Guess a number :)")
                        .font(.headline)
                    Text("Round \(game.count)")
                }.padding()
                
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
        .edgesIgnoringSafeArea(.all)
        .environment(\.font,
            Font.custom("Fredoka-Regular", size: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
