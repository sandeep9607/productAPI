//
//  APImanager.swift
//  ProductAPISwiftUI
//
//  Created by Sandeep on 12/08/24.
//

import Foundation

final class APImanager{
     func getProduct() async throws -> ProductList{
        let urlStr = "https://fakestoreapi.com/products"
        
        guard let url = URL(string: urlStr) else { throw ErrorCases.invalidUrl}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ErrorCases.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ProductList.self, from: data)
        }catch{
            throw ErrorCases.invalidData
        }
    }
}

enum ErrorCases: LocalizedError{
    case invalidUrl, invalidResponse, invalidData
    
    var errorDescription: String?{
        switch self {
        case .invalidUrl:
            return "Invalid URL Found"
        case .invalidResponse:
            return "Invalid response found"
        case .invalidData:
            return "Invaid data"
        }
    }
}
