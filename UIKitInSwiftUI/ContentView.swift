//
//  ContentView.swift
//  UIKitInSwiftUI
//
//  Created by Uriel Ortega on 15/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Integrating UITextField into SwiftUI")
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()

            UITextFieldWrapper(text: $text, placeholder: "Enter anything here...")
                .frame(height: 40)
                .padding()
            
            Text("You entered: \(text)")

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
