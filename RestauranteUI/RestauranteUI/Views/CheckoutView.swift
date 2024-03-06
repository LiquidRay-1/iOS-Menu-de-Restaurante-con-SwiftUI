//
//  CheckoutView.swift
//  RestauranteUI
//
//  Created by dam2 on 6/3/24.
//

import SwiftUI
//Nota para Git

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    //Propiedades de la forma de pago
    let paymentTypes = ["Efectivo", "Tarjeta de crédito", "Programa de puntos", "Robux"]
    @State private var paymentType = "Efectivo"
    
    //Propiedades de código de descuento
    @State private var addCuponDetails = false
    @State private var cuponCode = ""
    
    //Propinas
    let propinas = [5, 10, 15, 20, 0]
    @State private var propina = 5
    
    //Precio total
    var totalPrice: String {
        let total = Double(order.total)
        let totalPropina = total/100 * Double(propina)
        return (total + totalPropina).formatted(.currency(code: "EUR"))
    }
    
    //Alert pago realizado
    @State private var showingPaymentAlert = false
    
    var body: some View {
        Form{
            Section{
                Picker("Forma de pago", selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
            }
            Section{
                Toggle("Tengo un cupón de descuento", isOn: $addCuponDetails)
                if addCuponDetails == true {
                    TextField("Introduce el cupón", text: $cuponCode)
                }
            }
            Section("¿Dejar propina?"){
                Picker("Porcentaje de propina", selection: $propina){
                    ForEach(propinas, id: \.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total: \(totalPrice)"){
                Button("Confirmar pedido"){
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Finalizar compra")
        .navigationBarTitleDisplayMode(.inline)
        
        //Alert
        .alert("Pedido confirmado", isPresented: $showingPaymentAlert){
            //Botones
        } message: {
            Text("El importe total del pedido es de \(totalPrice), gracias.")
        }
    }
}

#Preview {
    NavigationStack{
        CheckoutView()
            .environmentObject(Order())
    }
}
