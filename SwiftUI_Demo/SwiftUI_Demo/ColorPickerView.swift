//
//  ColorPickerView.swift
//  SwiftUI_Demo
//
//  Created by user on 11/01/24.
//

import SwiftUI

struct ColorPickerView: View {
    // MARK: - Binding Property
    @Binding var selectedColor: String
    
    // Available colors for selection
    let colors = ["Red", "Green", "Blue", "Yellow", "Purple"]

    var body: some View {
        // Picker View for color selection
        Picker("Select a color", selection: $selectedColor) {
            ForEach(colors, id: \.self) { color in
                Text(color)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
