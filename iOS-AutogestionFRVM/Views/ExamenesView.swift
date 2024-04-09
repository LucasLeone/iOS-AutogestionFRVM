//
//  ExamenesView.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 07/04/2024.
//

import SwiftUI

struct ExamenesView: View {
    @StateObject var examenesViewModel = ExamenesViewModel()
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Cargando...")
            } else {
                List {
                    ForEach(examenesViewModel.detalles.indices, id: \.self) { index in
                        let detalle = examenesViewModel.detalles[index]
                        VStack(alignment: .leading) {
                            Text(detalle.nombreMateria)
                                .font(.headline)
                            Text("Fecha: \(detalle.fecha.prefix(10))")
                                .foregroundColor(.secondary)
                            Text("Nota: \(examenesViewModel.notaTexto(nota: detalle.nota))")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Exámenes")
        .onAppear {
            isLoading = true
            examenesViewModel.obtenerExamenes { success in
                isLoading = false
            }
        }
    }
}
