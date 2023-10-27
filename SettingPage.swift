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
        
        //        NavigationView {
        
        
        VStack{
            
            //HStack{
            
            Text("SETTINGS")
                .bold()
                .font(.largeTitle)
            HStack{
                Button(action: {
                    print("Il pulsante è stato premuto!")
                }) {
                    Text(
                        Image(systemName: "cart"))
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                }
                // } c'è un problema quando cambio questo porcodinci
            }
            .offset(x: 145, y: -65)
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
    //        .navigationBarItems(leading:
    //            HStack{
    //                Button(action: {
    //                    print("Il pulsante è stato premuto!")
    //                }) {
    //                    Text(
    //                        Image(systemName: "cart"))
    //                    .padding()
    //                    .background(Color.green)
    //                    .foregroundColor(.black)
    //                    .clipShape(Circle())
    //                }
    //            }
    
    //                        )
}





#Preview {
    SettingPage()
}
