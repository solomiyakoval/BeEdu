//
//  QiuzPageView.swift
//  BeeEducational
//
//  Created by Solomiya Koval on 19.10.2023.
//

import SwiftUI

struct QiuzPageView: View {
    var body: some View {
        
        
        
        
        
        ZStack {
            
            Image("quizbackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                
                
                Text("Question 1/10")
                    .font(Font.custom("Titan One", size: 40))
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.53, green: 0.8, blue: 0.36))
                    .frame(width: 327, height: 53, alignment: .top)
                
//                Spacer()
                
                Text ("Which one of this can create water pollution?")
                    .font(Font.custom("Titan One", size: 25))
                    .multilineTextAlignment(.center)
                
//                Spacer()
                
                
                Text("A")
                    .font(Font.custom("Titan One", size: 40))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                    .frame(width: 311, height: 41, alignment: .top)
                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                    .cornerRadius(40)
                
                Text("A")
                    .font(Font.custom("Titan One", size: 40))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                    .frame(width: 311, height: 41, alignment: .top)
                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                    .cornerRadius(40)
                
                
                Text("A")
                    .font(Font.custom("Titan One", size: 40))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                    .frame(width: 311, height: 41, alignment: .top)
                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                    .cornerRadius(40)
                
                Text("A")
                    .font(Font.custom("Titan One", size: 40))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                    .frame(width: 311, height: 41, alignment: .top)
                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                    .cornerRadius(40)
                            
                
                
            }
            .frame(width: 390, height: 844)
            .overlay(
                Rectangle()
                    .inset(by: -5)
                    .stroke(.black.opacity(0), lineWidth: 10)
                    .padding()
                
        )
        }
    }
    
}

#Preview {
    QiuzPageView()
}
