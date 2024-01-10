//
//  ContentView.swift
//  SwiftUI_Demo
//
//  Created by user on 18/12/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var abc = ""
}

struct ContentView: View {
    @AppStorage("name") var uname = ""
    @State var ex = Color.white
    @StateObject var viewModel = ViewModel()
    @ObservedObject var abcd = ViewModel()
    var data = ["", ""]
    var body: some View {
        ZStack(content: {
            Color.red
            kajd(ex: $ex)
        })
        .ignoresSafeArea()
    }
    
    /// something something
    /// - Parameter title: it will take title
    func abcd(title: String) {
        print("tilte ==", title)
    }
}

struct kajd: View {
    @Binding var ex: Color
    var body: some View {
        Text("ksdjh")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
