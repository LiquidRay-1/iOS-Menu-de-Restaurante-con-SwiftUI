//
//  ContentView.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(menu){ section in
                    Section(section.name){
                        
                        ForEach(section.items) { item in
                            NavigationLink(value:item){
                          //      ItemDetail(item: item)
                          //  } label: {
                                ItemRow(item: item)
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Menú")
            .listStyle(.grouped)
            .navigationDestination(for: MenuItem.self){ item in
                ItemDetail(item: item)
            }
        }
    }
}

#Preview {
    ContentView()
}
