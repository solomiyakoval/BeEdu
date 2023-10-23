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
                
                
                SettingPage()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                        
                    }
            }
        }
    }
}
