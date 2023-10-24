//
//  MainMenuExample.swift
//  TrashMinigameTest
//
//  Created by Michele Colella on 23/10/23.
//

import SwiftUI

struct MainMenuExample: View {
    @Binding var score: Int
    
    var body: some View {
        NavigationView {
            ZStack{
                Text("\(score)")
                
                NavigationLink(destination:{
                    MinigameTrash()
                }){
                    VStack{
                        Text("Go back")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 7)
                            .frame(width: 207, height: 96, alignment: .center)
                            .background(Color(red: 0.87, green: 0.3, blue: 0.27))
                            .cornerRadius(40)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            .zIndex(3)
                    }.padding(.top, 400).zIndex(3)
                }.zIndex(3)
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    MainMenuExample(score: .constant(0))
}
