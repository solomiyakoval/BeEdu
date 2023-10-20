//
//  ContentView.swift
//  BeeEducational
//
//  Created by Luca Caporicci on 17/10/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    var Player: String = "Gino"
    var Points: String = "2874365"
    var body: some View {
        
        
        ZStack {Color(.yellow)
                .opacity(0.16)
                .background()
                .ignoresSafeArea()
            
            VStack {
               
                
                
                Text("Welcome back")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
                Text("\(Player)!")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
                
                
                
                
                Text("Let's keep going on cleaning the world")
                    .bold()
                
                
                Text("Tap to continue..")
                    .padding(.top, 300)
                
                
            }
            .padding().frame(width: 500)
        }
    }
}

#Preview {
    ContentView()
}
