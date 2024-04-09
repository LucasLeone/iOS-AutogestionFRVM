//
//  HomeView.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 3/1/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var loginViewModel = LoginViewViewModel.sharedInstance
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sectionRows) { sectionRow in
                    if sectionRow.habilitada {
                        NavigationLink(destination: sectionRow.destinationView) {
                            sectionRow.content
                        }
                    } else {
                        sectionRow.content
                            .onTapGesture {
                                // Puedes agregar una acción aquí si quieres manejar el tap en las secciones deshabilitadas
                            }
                    }
                }
                // Agregar el botón de Logout al final de la lista
                Button(action: {
                    // Limpiar la información de usuario al hacer logout
                    UserDefaults.standard.removeObject(forKey: "student")
                    loginViewModel.loggedIn = false
                }) {
                    Text("Cerrar sesión")
                }
                .padding()
            }
            .listStyle(PlainListStyle())
        }
    }
    
    struct SectionRow: Identifiable {
        let id = UUID()
        let seccion: String
        let habilitada: Bool
        let destinationView: AnyView
        
        var content: some View {
            Text(seccion)
                .foregroundColor(habilitada ? .primary : .secondary)
                .padding()
        }
    }
    
    let sectionRows: [SectionRow] = [
        SectionRow(seccion: "Estado Académico", habilitada: true, destinationView: AnyView(EstadoAcademicoView())),
        SectionRow(seccion: "Exámenes", habilitada: true, destinationView: AnyView(ExamenesView())),
        SectionRow(seccion: "Materias Electivas", habilitada: true, destinationView: AnyView(MateriasElectivasView())),
        SectionRow(seccion: "Materias Cursando", habilitada: true, destinationView: AnyView(MateriasActualesView())),
        SectionRow(seccion: "Horarios", habilitada: true, destinationView: AnyView(HorariosView())),
        SectionRow(seccion: "Inscripción Examen", habilitada: false, destinationView: AnyView(EmptyView())),
        SectionRow(seccion: "Inscripción Cursado", habilitada: false, destinationView: AnyView(EmptyView())),
        SectionRow(seccion: "Prórrogas", habilitada: false, destinationView: AnyView(EmptyView())),
        SectionRow(seccion: "Datos Personales", habilitada: true, destinationView: AnyView(DatosPersonalesView()))
    ]
}
