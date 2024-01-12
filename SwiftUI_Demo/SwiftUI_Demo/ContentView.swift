//
//  ContentView.swift
//  SwiftUI_Demo
//
//  Created by user on 18/12/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("name") var currentUserName: String?
    @State private var username: String = ""
    @State private var selectedColor = "Blue"
    @State private var showSheet = false
    
    var body: some View {
        NavigationView() {
            VStack(spacing: 20) {
                TextField("Enter Username: ", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Text("Hi --- \(username)")
                Text("Stored Name: \(currentUserName ?? "No name available")")
                Button {
                    currentUserName = "Nick"
                } label: {
                    Text("Save".uppercased())
                }

                // Color Picker View
                ColorPickerSubView(selectedColor: $selectedColor)
                    .padding()
                Text("Selected color: \(selectedColor)")
                    .font(.title)
                
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Button")
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showSheet, content: {
                    ColorPickerSubView(selectedColor: $selectedColor)
                })
                
                NavigationLink {
                    ColorPickerView(selectedColor: $selectedColor)
                } label: {
                    Text("NewButton")
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    /// something something
    /// - Parameter title: it will take title
    func abcd(title: String) {
        print("tilte ==", title)
    }
}

//struct dummyModel: Identifiable {
//    var id: String = UUID().uuidString
//    let name: String
//}

struct ColorPickerSubView: View {
    // MARK: - Binding Property
    @Binding var selectedColor: String
    
   // let model: [dummyModel] = [dummyModel(name: "ja"), dummyModel(name: "ajhs"), dummyModel(name: "sdh")]
    
    // Available colors for selection
    let colors = ["Red", "Green", "Blue", "Yellow", "Purple"]

    var body: some View {
        // Picker View for color selection
        Picker("Select a color", selection: $selectedColor) {
//            ForEach(model) { _ in
//                
//            }
            ForEach(colors, id: \.self) { color in
                Text(color)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
