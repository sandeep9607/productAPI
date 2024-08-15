//
//  ProductModel.swift
//  ProductAPISwiftUI
//
//  Created by Sandeep on 12/08/24.
//

import Foundation

typealias ProductList = [ProductModel]

// MARK: - ProductListElement
struct ProductModel: Codable {
    var id: Int = 0
    let title: String?
    let price: Double?
    let description, category: String?
    let image: String?
    let rating: Rating?
    
    static var dummy: ProductModel{
        return ProductModel(id: 1,
                            title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                            price: 09.95,
                            description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                            category: "men's clothing",
                            image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                            rating: Rating(rate: 3.9, count: 120))
    }
}

// MARK: - Rating
struct Rating: Codable {
    var rate: Double = 0.0
    var count: Int = 0
}
