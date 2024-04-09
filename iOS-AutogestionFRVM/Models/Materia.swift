//
//  Materia.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 05/04/2024.
//

import Foundation

struct EstadoAcademico: Decodable {
    let persona: Persona
    let detalles: [DetalleMateria]
}

struct DetalleMateria: Decodable {
    let nombreMateria: String
    let codigoMateria: String
    let nivel: String
    let plan: String
    let estado: String?
    let faltaAprobar: String?
    let faltaReg: String?
    let anioCursado: Int?
    let faltasInjustificadas: [String]
    let faltasJustificadas: [String]
    let notas: [DetalleMateriaNota]?
    let nota: String
    let materia: Materia
    let estadoMateria: String
    let totalFaltas: Int
}

struct Materia: Decodable {
    let nombre: String
    let codigoAcademico: String
}

struct DetalleMateriaNota: Decodable {
    let nombre: String
    let notaNumero: String
    let notaLetra: String
    let estado: String
}

struct Examen: Decodable {
    let persona: Persona
    let detalles: [DetalleExamen]
}

struct DetalleExamen: Decodable {
    let fecha: String
    let nombreMateria: String
    let nota: String
    let especialidad: String
    let abreviaturaEspecialidad: String
    let plan: String
    let codigoMateria: String
    let estadoAprobacion: String
    let materia: Materia
    let estadoExamen: String
}

struct Horario: Decodable {
    let aula: Int
    let aulaNombre: String
    let id: Int
    let nombremateria: String
    let fechaInicio: String
    let fechaFin: String
    let especialidad: String
    let docente: String
    let anio: Int
}

struct MateriasPorDia {
    var dia: Int
    var materias: [String]
}

struct HorarioInfo {
    var materia: String
    var fechaInicio: String
    var fechaFin: String
    var aula: String
    var docente: String
    var carrera: String
}
