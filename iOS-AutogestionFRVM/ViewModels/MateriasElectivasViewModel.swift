//
//  MateriasElectivasViewModel.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 07/04/2024.
//

import Foundation
import Alamofire

class ElectivasViewModel: BaseViewModel {
    @Published var detalles: [Electiva] = []
    
    func obtenerElectivas(completion: @escaping (Bool) -> Void) {
        let url = "https://webservice.frvm.utn.edu.ar/autogestion/materias-electivas"
        realizarSolicitud(url: url) { (result: Result<[Electiva], Error>) in
            switch result {
            case .success(let electivas):
                self.detalles = electivas
                completion(true)
            case .failure(let error):
                // Manejar el error
                print("Error al obtener las materias electivas: \(error)")
                completion(false)
            }
        }
    }
}
