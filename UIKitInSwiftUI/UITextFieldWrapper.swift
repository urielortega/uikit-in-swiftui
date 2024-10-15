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
        
        return textField
    }
    
    /// Updates the `UITextField` with the latest SwiftUI state changes.
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text // Sync the text between SwiftUI and the UIKit text field.
    }
    
    /// Creates the coordinator that handles communication between the UIKit `UITextField` and SwiftUI.
    func makeCoordinator() -> Coordinator { Coordinator() }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
    }
}
