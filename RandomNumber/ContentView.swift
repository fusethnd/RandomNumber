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
    
    @State private var selectedFrom = 0
    let fromAr = Array(0...1000)
    @State private var selectedTo = 100
    let toAr = Array(0...1000)
    @State private var isShowingPicker = false
    
    var body: some View {
        ZStack {
            Color(hex: 0xFFD524)
            
            VStack {
                // Main frame
                ZStack {
                    RoundedRectangle(cornerRadius: 19)
                        .fill(Color(hex: 0xFFD524))
                        .frame(width: 327, height: 500)
                    RoundedRectangle(cornerRadius: 19)
                        .stroke(Color(hex: 0xA85116), lineWidth: 13)
                    // Customize the border color and width
                        .frame(width: 327, height: 500)
                    // Set the width and height of the square
                        .overlay(
                            VStack{
                                Text("ROUND")
                                    .foregroundColor(Color(hex: 0xA85116))
                                    .font(Font.custom("Fredoka-Bold", size: 20))
                                ZStack {
                                    RoundedRectangle(cornerRadius: 19)
                                        .fill(Color(.white))
                                    // Customize the border color and width
                                        .frame(width: 278.9, height: 65.6)
                                    RoundedRectangle(cornerRadius: 19)
                                        .stroke(Color(hex: 0xA85116), lineWidth: 8)
                                    // Customize the border color and width
                                        .frame(width: 278.9, height: 65.6)
                                    // Set the width and height of the square
                                        .overlay(
                                            Text("\(game.count)")
                                                .font(Font.custom("Fredoka-SemiBold", size: 30))
                                                .foregroundColor(Color(.black))
                                        )
                                } .padding(.bottom, 10)
                                
                                ZStack {
                                    // Background Image
                                    Image("fruit")
                                        .aspectRatio(contentMode: .fill)
                                        .edgesIgnoringSafeArea(.all)
                                    
                                    // Text on Top
                                    Text(String(game.toint(val: guess)))
                                        .foregroundColor(.white)
                                        .font(Font.custom("Fredoka-SemiBold", size: 50))
                                        .shadow(color: Color(hex: 0xDB620F).opacity(0.5), radius: 0,
                                                x: 3, y: 3)
                                        .padding(.top, 40)
                                }
                                HStack {
                                    Text("\(game.getFrom())")
                                        .font(Font.custom("Fredoka-Regular", size: 18))
                                        .padding(.trailing, 5)
                                    Slider(value: $guess)
                                        .frame(width: 200)
                                        .accentColor(Color(hex: 0xA85116))
                                    Text("\(game.getTo())")
                                        .font(Font.custom("Fredoka-Regular", size: 18))
                                        .padding(.leading, 5)
                                }
                            }
                        )
                    
                    Image("green")
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom, 600)
                    
                    Image("group-tree")
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom, 700)
                        .offset(x:30)
                    
                    
                    ZStack{
                        Image("Group-title")
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                        
                        Text("GUESS ME\nWHAT I AM?")
                            .foregroundColor(.white)
                            .font(Font.custom("Fredoka-Bold", size: 30))
                            .shadow(color: Color(hex: 0xDB620F).opacity(0.5),
                                    radius: 0, x: 3, y: 3)
                    }.padding(.bottom, 550)
                    
                    Button(action: {
                        showResult = true
                        game.check(guess: guess)
                    }) {
                        Image("Group-button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 269)
                            .overlay(
                                VStack {
                                    Text("HIT ME!")
                                        .font(Font.custom("Fredoka-Bold", size: 35))
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0xDB620F).opacity(0.5),
                                                radius: 0, x: 3, y: 3)
                                }
                            )
                    }.offset(y: 253)
                        .alert(isPresented: $showResult) {
                            Alert(
                                title: Text("Result"),
                                message: Text(game.text),
                                dismissButton: .default(Text("OK")) {
                                    if game.correct {
                                        guess = 0
                                        game.startNewGame()
                                    }
                                }
                            )
                        }
                }.padding(.top, 200)
                
                HStack {
                    Spacer()
                    ZStack {
                        Button {
                            isShowingPicker = true
                        } label: {
                            Image("custom-button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80) // Adjust the size as needed
                        }.sheet(isPresented: $isShowingPicker) {
                            VStack{
                                HStack{
                                    Picker("From", selection: $selectedFrom) {
                                        ForEach(0..<fromAr.count) { index in
                                            Text("\(self.fromAr[index])")
                                        }
                                    }
                                    .pickerStyle(WheelPickerStyle())
                                    .frame(width: 100)
                                    .padding()
                                    
                                    Text("to")
                                    
                                    Picker("To", selection: $selectedTo) {
                                        ForEach(0..<toAr.count) { index in
                                            Text("\(self.toAr[index])")
                                        }
                                    }
                                    .pickerStyle(WheelPickerStyle())
                                    .frame(width: 100)
                                    .padding()
                                }
                                Button("OK") {
                                    // Handle OK button action
                                    print("Selected Range: \(selectedFrom) to \(selectedTo)")
                                    game.setFrom(from: selectedFrom)
                                    game.setTo(to: selectedTo)
                                    isShowingPicker = false
                                }.padding()
                            }.presentationDetents([.fraction(0.5)])
                        }
                        Image("equalizer").frame(width: 100)
                    }.offset(x: 235)
                    Spacer()
                    ZStack {
                        Button {
                            game.startNewGame()
                        } label: {
                            Image("restart-button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80) // Adjust the size as needed
                        }
                        .padding()
                        
                        Image("undo-arrow").frame(width: 70)
                    }.offset(x: -235)
                    Spacer()
                    // Your existing custom range picker and OK button code
                }.offset(y: -250)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .environment(\.font, Font.custom("Fredoka-SemiBold", size: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
