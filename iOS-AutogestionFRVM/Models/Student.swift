//
//  Student.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 3/2/24.
//

import Foundation

struct Student: Codable {
    let id: Int
    let nick: String
    let grupo: String?
    let persona: String?
    let hashActual: String
}

struct Persona: Decodable {
    let id: Int
    let nombre: String
    let apellido: String
    let documento: Int
    let telefono: Int?
    let email: String?
    let alumno: Alumno
}

struct Alumno: Decodable {
    let legajo: String
    let especialidad: Especialidad
}

struct Especialidad: Decodable {
    let id: Int
    let nombre: String
    let codigoAcademico: String
}
