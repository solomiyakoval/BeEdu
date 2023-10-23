//
//  BeeEducationalApp.swift
//  BeeEducational
//
//  Created by Luca Caporicci on 17/10/23.
//

import SwiftUI

@main
struct BeeEducationalApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                
                ContentView()
                    .tabItem {
                        Image(systemName: "book")
                            Text("Quiz")
                    }
                ContentView()
                    .tabItem {
                        Image(systemName: "tree")
                        Text("My Plants")
                    }
                ContentView()
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
}
