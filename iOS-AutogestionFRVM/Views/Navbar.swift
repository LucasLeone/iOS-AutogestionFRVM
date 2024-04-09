//
//  Navbar.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 04/04/2024.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        VStack {
            Text("UTN - FRVM")
                .font(.title)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
        }.background(Color.orange)
    }
}

#Preview {
    Navbar()
}
