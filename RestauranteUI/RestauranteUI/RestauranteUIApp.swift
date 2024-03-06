//
//  RestauranteUIApp.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

@main
struct RestauranteUIApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .onAppear()
        }
    }
}
