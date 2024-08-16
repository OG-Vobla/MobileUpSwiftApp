//
//  LoginViewModel.swift
//  MobileUpSwiftApp
//
//  Created by Радэль Зубаиров on 16.08.2024.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var isLogin = false
    @Published var token = ""{
        didSet{
            if token != "" {
                UserDefaults.standard.setValue(token, forKey: "token")
                isLogin = true
                print(token)
            }
            else{
                isLogin = false
            }
        }
    }
    init() {
        token = UserDefaults.standard.string(forKey: "token") ?? ""
    }
}
