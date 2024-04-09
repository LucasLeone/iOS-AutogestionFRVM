//
//  LoginView.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 3/1/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewViewModel.sharedInstance
    
    var body: some View {
        VStack {
            Text("Iniciar Sesión")
                .font(.title)
                .padding(.top)
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                TextField("Legajo", text: $viewModel.legajo)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
            
                Button {
                    viewModel.login()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        
                        Text("Iniciar sesión")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .padding()
            }
            .scrollContentBackground(.hidden)
        }
    }
}

