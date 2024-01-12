//
//  FruitView.swift
//  SwiftUI_Demo
//
//  Created by user on 11/01/24.
//

import SwiftUI

struct FruitModel: Identifiable {
    var id = UUID().uuidString
    var name: String
    var count: Int
}

struct FruitView: View {
    @StateObject var viewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView(content: {
            List {
                if (viewModel.isLoading) {
                    ProgressView()
                } else {
                    ForEach(viewModel.fruitArray) { fruit in
                        HStack(content: {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        })
                    }
                    .onDelete(perform: viewModel.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit list")
            .navigationBarItems(trailing: NavigationLink(destination: {
                FruitSecondView(viewModel: viewModel)
            }, label: {
                Image(systemName: "arrow.right")
                    .font(.title)
            }))
        })
        .environmentObject(viewModel)
    }
}

struct FruitSecondView: View {
    @ObservedObject var viewModel: FruitViewModel
    var body: some View {
        ZStack(content: {
            Color.green.ignoresSafeArea()
            
            VStack {
                ForEach(viewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.bottom)
                NavigationLink {
                    FruitThirdView()
                } label: {
                    Text("go to third")
                }
            }
        })
    }
}

struct FruitThirdView: View {
    var body: some View {
        ZStack(content: {
            Color.yellow.ignoresSafeArea()
            
            NavigationLink {
                FruitFourthView()
            } label: {
                Text("go to fourth")
            }
        })
    }
}

struct FruitFourthView: View {
    @EnvironmentObject var viewModel: FruitViewModel
    var body: some View {
        ZStack(content: {
            Color.pink.ignoresSafeArea()

            VStack {
                ForEach(viewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        })
    }
}

#Preview {
    FruitView()
}
