//
//  EstadoAcademicoView.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 05/04/2024.
//

import SwiftUI

struct EstadoAcademicoView: View {
    @StateObject var estadoAcademicoViewModel = EstadoAcademicoViewModel()
    @State private var isLoading = false
    @State private var expandedDetalleIndices = Set<Int>()
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Cargando...")
            } else {
                List {
                    ForEach(estadoAcademicoViewModel.detallesPorNivel.sorted(by: { $0.key < $1.key }), id: \.key) { nivel, detalles in
                        Section(header: Text("Nivel \(nivel)")) {
                            ForEach(detalles.indices, id: \.self) { index in
                                let detalle = detalles[index]
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(detalle.nombreMateria)
                                            .font(.headline)
                                        Text(detalle.estadoMateria)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    Text(detalle.nota)
                                        .font(.headline)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        toggleDetalle(index: index, nivel: nivel)
                                    }
                                }
                                if expandedDetalleIndices.contains(generateUniqueIndex(index: index, nivel: nivel)) {
                                    VStack(alignment: .leading) {
                                        if let estado = detalle.estado {
                                            Text(estado)
                                        } else {
                                            Text(detalle.faltaAprobar ?? "No especificado")
                                        }
                                    }
                                    .font(.headline)
                                    .padding(.leading)
                                    .foregroundColor(.secondary)
                                }
                            }
                        }
                        .font(.title3)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Estado Académico")
        .onAppear {
            isLoading = true
            estadoAcademicoViewModel.obtenerEstadoAcademico { success in
                isLoading = false
            }
        }
    }
    
    func toggleDetalle(index: Int, nivel: String) {
        let uniqueIndex = generateUniqueIndex(index: index, nivel: nivel)
        if expandedDetalleIndices.contains(uniqueIndex) {
            expandedDetalleIndices.remove(uniqueIndex)
        } else {
            expandedDetalleIndices.insert(uniqueIndex)
        }
    }
    
    func generateUniqueIndex(index: Int, nivel: String) -> Int {
        return index * 1000 + (nivel.hashValue)
    }
}
