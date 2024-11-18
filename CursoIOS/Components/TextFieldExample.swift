//
//  TextFieldExample.swift
//  CursoIOS
//
//  Created by Joqtan on 17/11/24.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email: String = ""
    
    @State var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Email: ", text: $email)
                .keyboardType(.emailAddress)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email) { oldValue, newValue in
                    print("Old: \(oldValue), New: \(newValue)")
                }
            
            SecureField("Password: ", text: $password)
                .keyboardType(.default)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: password) { oldValue, newValue in
                    print("Old: \(oldValue), New: \(newValue)")
                }
        }
    }
}

#Preview {
    TextFieldExample()
}
