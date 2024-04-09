//
//  ExamenesViewModel.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 07/04/2024.
//

import Foundation
import Alamofire

class ExamenesViewModel: BaseViewModel {
    @Published var detalles: [DetalleExamen] = []
    
    func obtenerExamenes(completion: @escaping (Bool) -> Void) {
        let url = "https://webservice.frvm.utn.edu.ar/autogestion/examenes"
        realizarSolicitud(url: url) { (result: Result<Examen, Error>) in
            switch result {
            case .success(let examenes):
                var detalles = examenes.detalles
                detalles.sort { $0.fecha > $1.fecha } // Ordenar los detalles por fecha descendente
                self.detalles = detalles
                completion(true)
            case .failure(let error):
                // Manejar el error
                print("Error al obtener los exámenes: \(error)")
                completion(false)
            }
        }
    }
    
    func notaTexto(nota: String) -> String {
        switch nota.lowercased() {
        case "uno":
            return "1 (uno)"
        case "dos":
            return "2 (dos)"
        case "tres":
            return "3 (tres)"
        case "cuatro":
            return "4 (cuatro)"
        case "cinco":
            return "5 (cinco)"
        case "seis":
            return "6 (seis)"
        case "siete":
            return "7 (siete)"
        case "ocho":
            return "8 (ocho)"
        case "nueve":
            return "9 (nueve)"
        case "diez":
            return "10 (diez)"
        default:
            return "Ausente"
        }
    }
}
