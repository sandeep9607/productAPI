//
//  ProductViewModel.swift
//  ProductAPISwiftUI
//
//  Created by Sandeep on 12/08/24.
//

import Foundation

@Observable class ProductViewModel{
    
    var products: ProductList?
    
    private let manager = APImanager()
    
    func fetchProducts() async{
        do {
            products = try await manager.getProduct()
        }catch{
            print("Fetch product error", error.localizedDescription)
        }
    }
}
