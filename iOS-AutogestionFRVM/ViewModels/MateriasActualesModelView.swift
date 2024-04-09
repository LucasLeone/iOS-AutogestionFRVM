//
//  MateriasActuales.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 06/04/2024.
//

import Foundation
import Alamofire

class MateriasActualesViewModel: BaseViewModel {
    @Published var detalles: [DetalleMateria] = []
    @Published var datosPersonales: Persona? = nil
    
    func obtenerMateriasActuales(completion: @escaping (Bool) -> Void) {
        let url = "https://webservice.frvm.utn.edu.ar/autogestion/MateriasCursando"
        realizarSolicitud(url: url) { (result: Result<EstadoAcademico, Error>) in
            switch result {
            case .success(let materiasActuales):
                self.detalles = materiasActuales.detalles
                self.datosPersonales = materiasActuales.persona
                completion(true)
            case .failure(let error):
                // Manejar el error
                print("Error al obtener el estado académico: \(error)")
                completion(false)
            }
        }
    }
}
