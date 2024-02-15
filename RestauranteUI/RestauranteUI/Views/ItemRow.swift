//
//  ItemRow.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct ItemRow: View {
    
    let item: MenuItem
    
    let colors:[String: Color] = ["D": .purple, "G": .gray, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.black, lineWidth: 1))
                .shadow(radius: 5)
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("\(item.price) €")
            }
            Spacer()
            //Recorrer restricciones
            ForEach(item.restrictions, id:\.self){ restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .foregroundStyle(.white)
                    .clipShape(Circle())
            }
        }
        
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}
