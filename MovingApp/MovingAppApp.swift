//
//  MovingAppApp.swift
//  MovingApp
//
//  Created by Leone on 3/14/22.
//

import SwiftUI

@main
struct MovingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Instantiate an instance of the ViewModel
                .environmentObject(MoveViewModel())
        }
    }
}
