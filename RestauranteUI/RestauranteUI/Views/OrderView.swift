//
//  OrderView.swift
//  RestauranteUI
//
//  Created by dam2 on 6/3/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(order.items){ item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("\(item.price) €")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                Section{
                    NavigationLink("Finalizar pedido"){
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Pedido")
            .toolbar{
                EditButton()
                    .disabled(order.items.isEmpty)
            }
        }
    }
    func deleteItems(at Offsets: IndexSet){
        order.items.remove(atOffsets: Offsets)
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
