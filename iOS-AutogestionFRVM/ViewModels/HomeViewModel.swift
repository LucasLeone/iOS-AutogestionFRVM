//
//  HomeViewModel.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 04/04/2024.
//

//import Foundation
//import Alamofire
//
//class HomeViewModel: ObservableObject {
//    @Published var secciones: [Seccion] = []
//    
//    let nombreSecciones = [
//        "Calendario Academico",
//        "Estado Academico",
//        "Examenes",
//        "Inscripción a Examenes",
//        "Inscripción a Cursado",
//        "Datos Personales",
//        "Cambiar Contraseña",
//        "Encuestas",
//        "Pedido Prorrogas",
//        "Certificado Alumno Regular",
//        "Materias Cursando",
//        "Pedir Certificados",
//        "",
//        "Libro de Temas",
//        "Horario de Cursado",
//        "",
//        "Materias Electivas",
//        "Cooperadora"
//    ]
//
//    func obtenerSecciones() {
//            let defaults = UserDefaults.standard
//            if let studentData = defaults.data(forKey: "student"),
//               let student = try? JSONDecoder().decode(Student.self, from: studentData) {
//                let username = student.nick
//                let password = student.hashActual
//
//                let url = "https://webservice.frvm.utn.edu.ar/autogestion/secciones"
//
//                // Crear las credenciales en base64
//                let credentialsData = "\(username):\(password)".data(using: .utf8)!
//                let base64Credentials = credentialsData.base64EncodedString()
//
//                // Configurar el encabezado de autorización
//                let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)"]
//
//                // Realizar la solicitud GET con Alamofire
//                AF.request(url, headers: headers).responseDecodable(of: [Seccion].self) { response in
//                    switch response.result {
//                    case .success(let secciones):
//                        // Actualizar el estado con las secciones obtenidas
//                        DispatchQueue.main.async {
//                            self.secciones = secciones
//                        }
//                    case .failure(let error):
//                        // Manejar el error
//                        print("Error al obtener las secciones: \(error)")
//                    }
//                }
//            } else {
//                print("No se encontraron las credenciales de usuario en UserDefaults")
//            }
//        }
//}
