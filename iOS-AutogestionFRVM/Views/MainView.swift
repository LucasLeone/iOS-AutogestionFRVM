//
//  MainView.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 2/1/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var loginViewModel = LoginViewViewModel.sharedInstance
    
    var body: some View {
        Navbar()
        
        if loginViewModel.loggedIn {
            HomeView()
        } else {
            LoginView()
        }
    }
}
