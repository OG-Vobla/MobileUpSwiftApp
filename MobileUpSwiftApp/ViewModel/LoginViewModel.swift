//
//  LoginViewModel.swift
//  MobileUpSwiftApp
//
//  Created by Радэль Зубаиров on 16.08.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let userDefaults = UserDefaults.standard
    
    @Published var isLogin: Bool = false
    @Published var token: String = "" {
        didSet {
            handleTokenChange()
        }
    }
    
    init() {
        loadToken()
    }
    
    private func loadToken() {
        token = userDefaults.string(forKey: "token") ?? ""
    }
    
    private func handleTokenChange() {
        if token.isEmpty {
            userDefaults.removeObject(forKey: "token")
            isLogin = false
        } else {
            userDefaults.setValue(token, forKey: "token")
            isLogin = true
        }
    }
    
    func logOut() {
        token = ""
    }
    
    func logIn(with newToken: String) {
        token = newToken
    }
}
