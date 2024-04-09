//
//  Electivas.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 07/04/2024.
//

import Foundation

struct Electiva: Codable {
    let id: ElectivaId
    let materia: String
    let carrera: String
    let tipoCarrera: Int
    let alumno: String
    let examen: ElectivaComision
    let comision: Comision
    let regularizada: Bool
    let idCarrera: Int
    let cursando: Bool
    let idmateria: Int // Cambiado de idMateria a idmateria
    let estadoAprobacion: String
    let estadoAcademicoCursado: String
    let estadoAsistenciaCursado: String
    let aprobada: Bool
    let notaCursado: String
    let horas: Int
    let anoacademi: Int // Cambiado de anoAcademico a anoacademi
    let plan: Int
    let estadoExamen: String
    let fechaExamen: String
    let notaExamen: String
    let dictado: String
}

struct ElectivaId: Codable, Hashable {
    let plan: Int
    let materia: Int
    let especialid: Int
}

struct ElectivaComision: Codable {
    let planMateria: Int
    let materia: String
    let idmateria: Int // Cambiado de idMateria a idmateria
    let alumno: String
    let idCarrera: Int
    let carrera: String
    let tipoCarrera: Int
    let notaExamen: String
    let fechaExamen: String
    let estadoExamen: String
    let id: ElectivaId
}

struct Comision: Codable {
    let planMateria: Int
    let materia: String
    let idmateria: Int // Cambiado de idMateria a idmateria
    let anoacademi: Int // Cambiado de anoAcademico a anoacademi
    let horas: Int
    let dictado: String
    let alumno: String
    let idCarrera: Int
    let carrera: String
    let tipoCarrera: Int
    let notaCursado: String
    let estadoAcademicoCursado: String
    let estadoAsistenciaCursado: String
    let id: ElectivaId
}
