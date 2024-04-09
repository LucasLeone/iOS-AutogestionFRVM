//
//  MateriasActualesView.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 06/04/2024.
//

import SwiftUI

struct MateriasActualesView: View {
    @StateObject var materiasActualesViewModel = MateriasActualesViewModel()
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Cargando...")
            } else {
                List(materiasActualesViewModel.detalles, id: \.codigoMateria) { detalle in
                    VStack(alignment: .leading) {
                        Text(detalle.nombreMateria)
                            .font(.headline)
                        Text("Plan: \(detalle.plan)")
                            .foregroundColor(.secondary)
                        Text("Año cursado: \(detalle.anioCursado.map(String.init) ?? "No especificado")")
                            .foregroundColor(.secondary)
                        Text("Notas: \(detalle.notas?.map { "\($0.notaNumero) - \($0.notaLetra)" }.joined(separator: ", ") ?? "No especificado")")
                            .foregroundColor(.secondary)
                        Text("Faltas: \(detalle.faltasInjustificadas.isEmpty ? "No hay faltas" : "\(detalle.faltasInjustificadas.count) faltas injustificadas")")
                            .foregroundColor(.secondary)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Materias cursando")
        .onAppear {
            isLoading = true
            materiasActualesViewModel.obtenerMateriasActuales { success in
                isLoading = false
            }
        }
    }
}
