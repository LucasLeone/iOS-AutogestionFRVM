//
//  Seccion.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 04/04/2024.
//

import Foundation

struct Seccion: Codable, Identifiable {
    let id: Int
    let nombreSeccion: String
    let habilitada: Bool
    let descripcion: String
}
