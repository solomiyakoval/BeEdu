//
//  StartingQuiz.swift
//  BeeEducational
//
//  Created by Luca Caporicci on 23/10/23.
//

import SwiftUI


struct QiuzPageView: View {
    var body: some View {
        
        
        let questionViewModel = QuestionViewModel()
        
        
        ZStack {
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                
                
                Text("Question 1/5")
                    
                
                    .font(.system(size: 55))
                    .bold()
                
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.53, green: 0.8, blue: 0.36))
                    .frame(width: 327, height: 53, alignment: .top)
                    .padding(20)
                
                
                
                Text (questionViewModel.questions[0].question)
                    .font(.system(size: 25))
                    .bold()
                
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                
                
                
                Text(questionViewModel.questions[0].answer1)
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                    .frame(width: 311, height: 41, alignment: .top)
                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                    .cornerRadius(40)
                
                Text(questionViewModel.questions[0].answer2)
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                    .frame(width: 311, height: 41, alignment: .top)
                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                    .cornerRadius(40)
                
                
                Text(questionViewModel.questions[0].answer3)
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                    .frame(width: 311, height: 41, alignment: .top)
                    .background(Rectangle().fill(Color.gray).shadow(radius: 3))
                    .cornerRadius(40)
                
                Text(questionViewModel.questions[0].answer4)
                    .font(.system(size: 25))
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
