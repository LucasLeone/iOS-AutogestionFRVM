//
//  LoginViewViewModel.swift
//  iOS-AutogestionFRVM
//
//  Created by Lucas Leone on 3/1/24.
//

import Foundation
import Alamofire

class LoginViewViewModel: ObservableObject {
    @Published var legajo = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var loggedIn = false

    static let sharedInstance = LoginViewViewModel()

    func login() {
        guard self.validate() else {
            return
        }

        let url = "https://webservice.frvm.utn.edu.ar/autogestion/login";
        let headers: HTTPHeaders = [
            "nick": legajo,
            "password": password
        ]

        AF.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let student = try JSONDecoder().decode(Student.self, from: data)
                    if let encodedStudent = try? JSONEncoder().encode(student) {
                        UserDefaults.standard.set(encodedStudent, forKey: "student")
                        UserDefaults.standard.synchronize()
                        print("Student saved to UserDefaults")
                        self.errorMessage = ""
                        self.loggedIn = true
                    } else {
                        print("Error encoding student object")
                    }
                } catch {
                    if let statusCode = response.response?.statusCode, statusCode == 401 {
                        print("Credenciales incorrectas.")
                        self.errorMessage = "Legajo/Contraseña incorrectos."
                    }
                    return
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    private func validate() -> Bool {
        guard !legajo.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.errorMessage = "Llenar todos los campos, por favor."
            return false
        }
        return true
    }
}
