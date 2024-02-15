//
//  Menu.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct MenuItem: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var photoCredit: String
    var price: Int
    var restrictions: [String]
    var description: String
    
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    var thumbnailImage: String {
        mainImage + "-thumb"
    }
    
    #if DEBUG
    static let example = MenuItem(id: UUID(), name: "All Out Donuts", photoCredit: "Iñigo Acosta", price: 10, restrictions:  ["G","C"], description: "Desayuno típico de la zona")
    #endif
}

struct MenuSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}
