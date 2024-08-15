//
//  ProductRowView.swift
//  ProductAPISwiftUI
//
//  Created by Sandeep on 12/08/24.
//

import SwiftUI

struct ProductRowView: View {
    var product: ProductModel
    
    var body: some View {
        HStack(spacing: 8){
            if let url = URL(string: product.image ?? ""){
                productImage(url: url)
            }
            
            VStack(alignment: .leading, spacing: 8){
                Text(product.title ?? "")
                    .font(.headline)
                    .lineLimit(2)
                
                HStack{
                    Text(product.category ?? "")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                    
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                        
                        Text(product.rating?.rate.toString() ?? "")
                    }
                    .fontWeight(.medium)
                    .foregroundStyle(.yellow)
                }
                
                //Description
                Text(product.description ?? "")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
                //Price & Buy button
                HStack{
                    Text(product.price?.currencyFormat() ?? "")
                        .font(.title3)
                        .foregroundStyle(.indigo)
                    
                    Spacer()
                    
                    buyButton
                    
                }
            }
        }
        .padding()
    }
    
    func productImage(url: URL) -> some View{
        AsyncImage(url: url) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)
    }
    
    var buyButton: some View{
        Button {
            //
        } label: {
            Text("Buy")
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.indigo)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    ProductRowView(product: ProductModel.dummy)
}
