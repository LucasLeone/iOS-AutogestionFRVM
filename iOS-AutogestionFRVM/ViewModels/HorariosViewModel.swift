//
//  HorariosViewModel.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 07/04/2024.
//

import Foundation
import Alamofire


class HorariosViewModel: BaseViewModel {
    @Published var horarios: [[HorarioInfo]] = Array(repeating: [], count: 7)
    
    func obtenerHorarios(completion: @escaping (Bool) -> Void) {
        let url = "https://webservice.frvm.utn.edu.ar/autogestion/fechas-cursado"
        realizarSolicitud(url: url) { (result: Result<[Horario], Error>) in
            switch result {
            case .success(let horarios):
                var horariosPorDia: [[HorarioInfo]] = Array(repeating: [], count: 7)
                
                // Crear un DateFormatter para formatear las fechas en GMT-3
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                dateFormatter.timeZone = TimeZone(identifier: "GMT-3")
                
                // Iterar sobre cada horario obtenido
                for horario in horarios {
                    // Convertir la fecha de inicio y fin al huso horario GMT-3
                    if let startDate = dateFormatter.date(from: horario.fechaInicio),
                       let endDate = dateFormatter.date(from: horario.fechaFin) {
                        let horarioInfo = HorarioInfo(materia: horario.nombremateria,
                                                      fechaInicio: dateFormatter.string(from: startDate),
                                                      fechaFin: dateFormatter.string(from: endDate),
                                                      aula: "\(horario.aulaNombre)",
                                                      docente: horario.docente,
                                                      carrera: horario.especialidad)
                        
                        // Obtener el día de la semana como número (1: Domingo, 2: Lunes, ..., 7: Sábado)
                        let calendar = Calendar.current
                        let dayOfWeek = calendar.component(.weekday, from: startDate) - 1
                        
                        // Verificar si la materia ya se ha agregado para este día
                        let materiaExistente = horariosPorDia[dayOfWeek].contains { $0.materia == horario.nombremateria }
                        
                        // Agregar la materia solo si no existe para este día
                        if !materiaExistente {
                            horariosPorDia[dayOfWeek].append(horarioInfo)
                        }
                    }
                }
                
                // Asignar los horarios agrupados por día al ViewModel
                self.horarios = horariosPorDia
                completion(true)
            case .failure(let error):
                // Manejar el error
                print("Error al obtener los horarios: \(error)")
                completion(false)
            }
        }
    }
}
