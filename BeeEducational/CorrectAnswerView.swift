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
