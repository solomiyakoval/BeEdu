//
//  PlantView.swift
//  BeeEducational
//
//  Created by Francesco Palumbo on 26/10/23.
//

import SwiftUI

struct PlantView: View {
    var body: some View {
        VStack{
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
            .offset(x: 140, y: -350)
            
           
        }
    }
}


#Preview {
    PlantView()
}
