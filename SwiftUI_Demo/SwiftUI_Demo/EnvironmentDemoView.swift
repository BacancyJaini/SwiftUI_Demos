//
//  EnvironmentDemoView.swift
//  SwiftUI_Demo
//
//  Created by user on 11/01/24.
//

import SwiftUI

struct EnvironmentDemoView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showSheet: Bool = false
    
    var body: some View {
        Text("Hello, world!")
            .foregroundColor(colorScheme == .dark ? .white : .black)
        
        Button {
            showSheet.toggle()
        } label: {
            Text("Show sheet")
                .padding()
                .background(Color.primary)
                .cornerRadius(10)
        }
        .sheet(isPresented: $showSheet, content: {
            SecondScreen()
                .presentationDetents([.medium, .large])
        })
    }
}

struct SecondScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            Color.red.ignoresSafeArea()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .padding()
        })
    }
}

#Preview {
    SecondScreen()
}
