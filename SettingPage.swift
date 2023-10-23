//
//  SettingPage.swift
//  BeeEducational
//
//  Created by Luca Caporicci on 19/10/23.
//

import SwiftUI

struct SettingPage: View {
    
    var player = "Gino"
    var body: some View{
        
        

        
        VStack{
            Text("SETTINGS")
                .bold()
                .font(.largeTitle)
                
            ZStack {
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 367, height: 96)
                    .background(Color(red: 0.45, green: 0.95, blue: 0.37).opacity(0.13))
                    .cornerRadius(45)
                
                HStack {
 
                //immagine
                    Circle()
                    .foregroundColor(.black)
                    .frame(width: 80)
                    .padding()
                    
                
                    VStack (alignment: .leading) {
                        
                        Text("\(player)")
                            .bold()
                            .font(.title2)
                        //   .frame(width: 50, height: 50)
                        
                        Text("Points: 83479")
                        
                        
                    }
                    
                    
                } .padding(.trailing, 150)
                
                
          }
            List{
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    Text("Sound effects")
                }
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    Text("Push notification")
                }
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    Text("Save Photos to library")
                }
            }
          
            
                Button("💡 Question/Suggestions") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                
            }
        }
    }
}

#Preview {
    SettingPage()
}
