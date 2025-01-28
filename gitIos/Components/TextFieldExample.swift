//
//  TextFieldExample.swift
//  gitIos
//
//  Created by Danilo Osorio on 14/01/25.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        
        VStack {
            TextField("Escribe tu email",text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal,16)
                .onChange(of: email, {oldValue,newValue in
                    print("el valor antiguo era \(oldValue) y el nuevo \(newValue)")
                })
            SecureField("Escribe tu contraseña",text: $password)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal,16)
                .onChange(of: email, {oldValue,newValue in
                    print("el valor antiguo era \(oldValue) y el nuevo \(newValue)")
                })
        }
    }
}

#Preview {
    TextFieldExample()
}
