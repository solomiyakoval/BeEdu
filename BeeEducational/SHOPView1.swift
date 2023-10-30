//
//  Prova1.swift
//  BeeEducational
//
//  Created by Luca Caporicci on 30/10/23.
//

import SwiftUI
import Foundation

struct pianta: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var description: String
}
class Plants {
    
    var plant: [pianta] = [
        pianta(name: "sghe", imageName: "", description: "")]
}
struct Prova1: View {
    let images = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9"]
    let names = ["pianta1", "pianta2", "pianta3", "pianta4", "pianta5", "pianta6", "pianta7", "pianta8", "pianta9"]
    
    var body: some View {
        
        ZStack{
            //
            //            Button(action: {
            //                print("Il pulsante è stato premuto!")
            //            }) {
            //                Text(
            //                    Image(systemName: "cart"))
            //                .padding()
            //                .background(Color.green)
            //                .foregroundColor(.black)
            //                .clipShape(Circle())
            //            }
            //          //  .position(x: 100, y: 100)
            
            NavigationStack{
         //       HStack{
//                    Button(action: {
//                        print("Il pulsante è stato premuto!")
//                    }) {
//                        Text(
//                            Image(systemName: "arrowshape.backward"))
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.black)
//                        .clipShape(Circle())
//                    }
//                    .padding()
//                    Spacer()
                  
                //}
                ScrollView{
                    
                    VStack {
                        
                        ForEach(0..<images.count) { index in
                            RectangleView()
                            
                            ZStack(alignment: .bottom){
                                VStack (alignment: .leading){
                                    
                                    HStack{
                                        Text(names[index])
                                            .font(.title)
                                            .bold()
                                        
                                    }
                                }
                                
                            }
                            
                        }
                    }
                }
                .toolbar(content: {  Button(action: {
                    print("Il pulsante è stato premuto!")
                }) {
                    Text(
                        Image(systemName: "arrowshape.backward"))
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                    }
                    
                .padding([.trailing], 300)
                
                })
                
            }
           
        }
    }
    
}

#Preview {
    Prova1()
}
