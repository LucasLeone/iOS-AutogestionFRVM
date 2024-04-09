//
//  MateriasElectivasView.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 07/04/2024.
//

import SwiftUI

struct MateriasElectivasView: View {
    @StateObject var electivasViewModel = ElectivasViewModel()
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Cargando...")
            } else {
                List(electivasViewModel.detalles, id: \.id) { electiva in
                    VStack(alignment: .leading) {
                        Text(electiva.materia)
                            .font(.headline)
                        Text("Horas: \(electiva.horas)")
                            .foregroundColor(.secondary)
                        Text("Estado: \(electiva.estadoAprobacion)")
                            .foregroundColor(.secondary)
                        Text("Nota: \(electiva.notaExamen)")
                            .foregroundColor(.secondary)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Materias Electivas")
        .onAppear {
            isLoading = true
            electivasViewModel.obtenerElectivas { success in
                isLoading = false
            }
        }
    }
}
