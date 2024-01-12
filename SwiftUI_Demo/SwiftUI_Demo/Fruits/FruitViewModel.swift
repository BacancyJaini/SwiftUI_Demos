//
//  FruitViewModel.swift
//  SwiftUI_Demo
//
//  Created by user on 11/01/24.
//

import Foundation
class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let f1 = FruitModel(name: "apple", count: 10)
        let f2 = FruitModel(name: "banana", count: 14)
        let f3 = FruitModel(name: "watermelon", count: 5)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.fruitArray.append(contentsOf: [f1, f2, f3])
            self.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}
