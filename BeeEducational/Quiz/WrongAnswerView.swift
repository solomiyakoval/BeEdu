//
//  WrongAnswerView.swift
//  BeeEducational
//
//  Created by Solomiya Koval on 24.10.2023.
//

import SwiftUI

struct WrongAnswerView: View {
    var body: some View {
        
        
        let questionViewModel = QuestionViewModel()
        
        
        ZStack {
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                
                Text ("Try again!")
                    
                    .font(.system(size: 55))
                    .bold()
                   .shadow(color: .gray, radius: 10, x:5)
            
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.87, green: 0.3, blue: 0.27))
                
                    .frame(width: 327, height: 53, alignment: .center)
                    .padding(20)
            
                
                Text(" Correct answer is:")
                    .font(.system(size: 30))
                    
                
                    .multilineTextAlignment(.center)
                    .foregroundColor (.black)
                    .padding(5)
                
                
                Text(questionViewModel.questions[0].answer)
                    .font(.system(size: 25))
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 311, height: 41, alignment: .center)
                    .background(Rectangle().fill(Color (red: 0.53, green: 0.8, blue: 0.36)).shadow(radius: 3))
                    .cornerRadius(40)
                    .padding(10)
                
                
                
                
                
                
            }
            
            
        
            .frame(width: 340, height: 800)
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
    WrongAnswerView()
}
