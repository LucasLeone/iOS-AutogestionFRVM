//
//  EstadoAcademicoViewModel.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 05/04/2024.
//

import Foundation
import Alamofire


class EstadoAcademicoViewModel: BaseViewModel {
    @Published var detallesPorNivel: [String: [DetalleMateria]] = [:]
    
    func obtenerEstadoAcademico(completion: @escaping (Bool) -> Void) {
        let url = "https://webservice.frvm.utn.edu.ar/autogestion/estado-academico"
        realizarSolicitud(url: url) { (result: Result<EstadoAcademico, Error>) in
            switch result {
            case .success(let estadoAcademico):
                let detalles = estadoAcademico.detalles
                self.detallesPorNivel = Dictionary(grouping: detalles, by: { $0.nivel })
                completion(true)
            case .failure(let error):
                // Manejar el error
                print("Error al obtener el estado académico: \(error)")
                completion(false)
            }
        }
    }
}
