//
//  UITextFieldWrapper.swift
//  UIKitInSwiftUI
//
//  Created by Uriel Ortega on 15/10/24.
//

import SwiftUI
import UIKit

/// A SwiftUI wrapper for `UITextField` that allows customization of placeholder and text binding.
struct UITextFieldWrapper: UIViewRepresentable {
    @Binding var text: String
    let placeholder: String?
    
    /// Creates and returns the `UITextField` to be displayed in the SwiftUI view.
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator // Setting the coordinator as the delegate.
        textField.placeholder = placeholder
        textField.borderStyle = .bezel
        
        return textField
    }
    
    /// Updates the `UITextField` with the latest SwiftUI state changes.
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text // Sync the text between SwiftUI and the UIKit text field.
    }
    
    /// Creates the coordinator that handles communication between the UIKit `UITextField` and SwiftUI.
    func makeCoordinator() -> Coordinator {
        Coordinator(self) // Passing the current instance of `UITextFieldWrapper` to the coordinator.
    }
    
    /// A class that acts as the coordinator between the `UITextField` and SwiftUI.
    class Coordinator: NSObject, UITextFieldDelegate {
        /// The parent view, allowing access to the SwiftUI state.
        var parent: UITextFieldWrapper
        
        /// Initializes the coordinator with a reference to the parent `UITextFieldWrapper`.
        init(_ parent: UITextFieldWrapper) {
            self.parent = parent
        }
        
        /// Called when the text in the `UITextField` changes. This keeps the SwiftUI text binding in sync.
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? "" // Updating the SwiftUI-bound text value.
        }
        
        /// Called when Return key is pressed to dismiss the keyboard.
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
}
