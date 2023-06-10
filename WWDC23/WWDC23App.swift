//
//  WWDC23App.swift
//  WWDC23
//
//  Created by 강병민 on 2023/06/10.
//

import SwiftUI
import SwiftData

@main
struct WWDC23App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    NavigationLink("Symbols") {
                        Symbols()
                    }
                    NavigationLink("SwiftData") {
                        ContentView()
                    }
                }
            }
        }
        .modelContainer(for: Item.self)
    }
}
