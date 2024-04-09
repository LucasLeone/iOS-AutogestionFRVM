//
//  BaseViewModel.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 09/04/2024.
//

import Foundation
import Alamofire

class BaseViewModel: ObservableObject {
    
    func obtenerCredenciales() -> (String, String)? {
        let defaults = UserDefaults.standard
        guard let studentData = defaults.data(forKey: "student"),
              let student = try? JSONDecoder().decode(Student.self, from: studentData) else {
            print("No se encontraron las credenciales de usuario en UserDefaults")
            return nil
        }
        let username = student.nick
        let password = student.hashActual
        return (username, password)
    }
    
    func realizarSolicitud<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let (username, password) = obtenerCredenciales() else {
            completion(.failure(NSError(domain: "Credenciales no encontradas", code: -1, userInfo: nil)))
            return
        }
        
        let credentialsData = "\(username):\(password)".data(using: .utf8)!
        let base64Credentials = credentialsData.base64EncodedString()
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)"]
        
        AF.request(url, headers: headers).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
