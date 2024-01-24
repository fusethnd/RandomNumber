//
//  ContentView.swift
//  RandomNumber
//
//  Created by Thanadon Boontawee on 19/1/2567 BE.
//

import SwiftUI
extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex & 0xFF0000) >> 16) / 255.0,
            green: Double((hex & 0x00FF00) >> 8) / 255.0,
            blue: Double(hex & 0x0000FF) / 255.0
        )
    }
}

struct ContentView: View {
    @State var game = Game()
    @State var guess: Double = 0.0
    @State var showResult = false
    
    var body: some View {
        ZStack {
            Color(hex: 0xFFD524)
            
            VStack {
                ZStack {
                    Image("Group-title")
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    Text("Guess me\nwhat I am?")
                        .foregroundColor(.white)
                        .font(Font.custom("Fredoka-Regular", size: 25))
                }
                // Square with Border
                ZStack {
                    Rectangle()
                        .fill(Color(hex: 0xFFD524))
                        .frame(width: 327, height: 549.8)
                    Rectangle()
                        // .fill(Color(hex: 0xFFD524))
                        .stroke(Color(hex: 0xA85116), lineWidth: 13)
                        // Customize the border color and width
                        .frame(width: 327, height: 549.8)
                        // Set the width and height of the square
                        .overlay( // Text("Hello, world")
                            VStack{
                                Text("Round")
                                    .foregroundColor(Color(hex: 0xA85116))
                                    .font(Font.custom("Fredoka-Regular", size: 20))
                                ZStack {
                                    Rectangle()
                                        .fill(Color(.white))
                                        // Customize the border color and width
                                        .frame(width: 278.9, height: 65.6)
                                    Rectangle()
                                        .stroke(Color(hex: 0xA85116), lineWidth: 8)
                                        // Customize the border color and width
                                        .frame(width: 278.9, height: 65.6)
                                        // Set the width and height of the square
                                        .overlay(
                                            Text("\(game.count)")
                                                .font(Font.custom("Fredoka-Regular", size: 20))
                                        )
                                }

                                ZStack {
                                    // Background Image
                                    Image("fruit")
                                        .aspectRatio(contentMode: .fill)
                                        .edgesIgnoringSafeArea(.all)

                                    // Text on Top
                                    Text(String(Game.toint(val: guess)))
                                        .foregroundColor(.white)
                                        .font(Font.custom("Fredoka-Regular", size: 50))
                                        .padding()
                                }
                                HStack {
                                    Text("0")
                                    Slider(value: $guess)
                                        .frame(width: 200)
                                        .accentColor(Color(hex: 0xA85116))
                                    Text("100")
                                }
                            }
                        )
                }
               
                
                ZStack {
                    Image("Group-button")
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)

                    Button("HIT ME!") {
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
