//
//  DatosPersonalesView.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 08/04/2024.
//

import SwiftUI

struct DatosPersonalesView: View {
    @StateObject var viewModel = MateriasActualesViewModel()
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Cargando...")
            } else {
                if let persona = viewModel.datosPersonales {
                    Text("Nombre: \(persona.nombre)")
                    Text("Apellido: \(persona.apellido)")
                    Text("Documento: \(persona.documento)")

                    if let telefono = persona.telefono {
                        Text("Teléfono: \(telefono)")
                    }

                    if let email = persona.email {
                        Text("Email: \(email)")
                    }

                    Text("Legajo: \(persona.alumno.legajo)")

                    Text("Carrera: \(persona.alumno.especialidad.nombre)")
                } else {
                    Text("No se han encontrado datos personales")
                }
            }
        }
        .navigationTitle("Datos Personales")
        .onAppear {
            isLoading = true
            viewModel.obtenerMateriasActuales { success in
                isLoading = false
            }
        }
    }
}
