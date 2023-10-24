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
        ZStack{
            Text("\(score)")
            
            VStack{
                Text("Premi")
                    .padding(.top, 200.0)
            }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
        }.navigationBarHidden(true)
    }
}

#Preview {
    MainMenuExample(score: .constant(0))
}
