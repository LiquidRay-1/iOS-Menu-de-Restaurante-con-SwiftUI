//
//  ItemDetail.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order: Order
    
    @State private var showPaymentAlert = false
    
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
            Button("Añadir al pedido"){
                order.add(item: item)
                showPaymentAlert.toggle()
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        //Alert
        .alert("Artículo añadido al pedido", isPresented: $showPaymentAlert) {
            //Botones
        } message: {
            Text("El artículo se ha añadido al pedido")
        }
    }
}

#Preview {
    NavigationStack{
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
