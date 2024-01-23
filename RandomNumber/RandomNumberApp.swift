//
//  RandomNumberApp.swift
//  RandomNumber
//
//  Created by Thanadon Boontawee on 19/1/2567 BE.
//

import SwiftUI

@main
struct RandomNumberApp: App {
    
    init() {
        printFonts()
    }
    
    func printFonts(){
        let fontFamilyNames = UIFont.familyNames
        
        for familyName in fontFamilyNames {
            print("----------")
            print("Font Family name -> [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font names ==> [\(names)]")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
