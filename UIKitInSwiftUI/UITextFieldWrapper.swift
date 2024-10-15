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
    
    func makeUIView(context: Context) -> UITextField {
        return UITextField() // Placeholder to avoid warnings.
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return UITextFieldWrapper.Coordinator() // Placeholder to avoid warnings.
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
    }
}
