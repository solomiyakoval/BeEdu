//
//  ContentView.swift
//  BeeEducational
//
//  Created by Luca Caporicci on 17/10/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            if showSplash {
                WelcomeScreenView()
                    .transition(.opacity)
                    .animation(
                        .easeOut(duration: 1.5))
            } else {
                Text("We bello")
                
                TabView {
                    
                    QiuzPageView()
                        .tabItem {
                            Image(systemName: "book")
                            Text("Quiz")
                        }
                   PlantView()
                        .tabItem {
                            Image(systemName: "tree")
                            Text("My Plants")
                        }
                    StartingQuiz()
                        .tabItem {
                            Image(systemName: "gamecontroller")
                            Text("Minigames")
                        }
                    SettingPage()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                }
            }
        }
                .onAppear {
                    DispatchQueue.main
                        .asyncAfter(deadline: .now()+2)
                    {
                        withAnimation {
                            self.showSplash = false
                        }
                        
                    }
                }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

    
#Preview {
    ContentView()
}
