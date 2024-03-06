//
//  MainView.swift
//  RestauranteUI
//
//  Created by dam2 on 6/3/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Label("Carta", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Pedido", systemImage: "cart")
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
