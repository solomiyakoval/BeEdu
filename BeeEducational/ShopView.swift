//
//  ShopViewModel.swift
//  BeeEducational
//
//  Created by Francesco Ciaramella on 24/10/23.
//

import Foundation
import SwiftUI

struct RectangleView: View {
    var body: some View {
        Rectangle()
            .frame(width: 320, height: 320)
            .foregroundColor(.yellow)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
        
    }
}

struct ShopViewModel:View {
    let numberOfRectangles = 5
    var body: some View {
        VStack{
            List {
                ForEach(0..<numberOfRectangles, id: \.self) { index in
                    RectangleView() }
            }
        }
    }
}
#Preview {ShopViewModel()
}

//struct MyApp: App {
//var body: some Scene {
// WindowGroup {
// ShopViewModel()
