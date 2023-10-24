//
//  WelcomeScreenView.swift
//  BeeEducational
//
//  Created by Francesco Palumbo on 24/10/23.
//

import SwiftUI

struct WelcomeScreenView: View {
    
    var Player: String = "Gino"
    var Points: String = "2874365"
    var body: some View {
        
        
        ZStack {Color(.yellow)
                .opacity(0.16)
                .background()
                .ignoresSafeArea()
            
            Ellipse()
                .size(CGSize(width: 390.0, height: 190.0))
                .position(CGPoint(x: 200.0, y: 670.0))
                .foregroundColor(.white)
                .opacity(0.90)
           
            
            
            
            VStack {
                
                Text("Welcome back")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
                Text("\(Player)!")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
                   
                
                
                
            }.position(CGPoint(x: 200.0, y: 370.0))
            VStack{
                Text("Let's keep going on cleaning the world")
                    .bold()
                    .position(CGPoint(x: 195.0, y: 430.0))
                
            }
            VStack{
                Image("hive")
                    .position(CGPoint(x: 328.0, y: 170.0))
            
                
            }
            VStack {
                Image("bee")
                    .position(CGPoint(x: 50.0, y: 260.0))
            }
            VStack {
                Image("Arrow1")
                    .position(CGPoint(x: 200.0, y: 310.0))
            }
            }
                   
                
                
            }
            
        }
    

#Preview {
    WelcomeScreenView()
}
