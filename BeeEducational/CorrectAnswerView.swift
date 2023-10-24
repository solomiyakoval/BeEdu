//
//  CorrectAnswerView.swift
//  BeeEducational
//
//  Created by Solomiya Koval on 23.10.2023.
//

import SwiftUI

struct CorrectAnswerView: View {
        var body: some View {
            
            
            let questionViewModel = QuestionViewModel()
            
            
            ZStack {
                
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text ("You are right!")
                    
                        .font(.system(size: 55))
                        .bold()
                        
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.53, green: 0.8, blue: 0.36))
                        .padding(20)
                
                    
                    Text(" Correct answer is:")
                        .font(.system(size: 30))
                        
                    
                        .multilineTextAlignment(.center)
                        .foregroundColor (.black)
                        .padding(5)
                    
                    
                    Text(questionViewModel.questions[0].correctanswer)
                        .font(.system(size: 25))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 311, height: 41, alignment: .top)
                        .background(Rectangle().fill(Color (red: 0.53, green: 0.8, blue: 0.36)).shadow(radius: 3))
                        .cornerRadius(40)
                        .padding(10)
                    
                    
                    
                    
                    
                    
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
    CorrectAnswerView()
}
