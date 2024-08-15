//
//  ContentView.swift
//  ProductAPISwiftUI
//
//  Created by Sandeep on 12/08/24.
//

import SwiftUI

struct ProductView: View {
    
    let viewModel = ProductViewModel()
    
    var body: some View {
        
        NavigationStack{
            List(viewModel.products ?? [], id: \.id){ product in
                ProductRowView(product: product)
            }
            
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductView()
}
