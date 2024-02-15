//
//  ItemDetail.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct ItemDetail: View {
    
    let item: MenuItem //Almacena el item que se va almacenar
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Foto: \(item.photoCredit)")
                    .padding(2)
                    .foregroundStyle(.white)
                    .background(.black)
                    .font(.caption)
                    .offset(x:0, y:-5)
            }
            Text(item.description)
                .padding()
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        ItemDetail(item: MenuItem.example)
    }
}
