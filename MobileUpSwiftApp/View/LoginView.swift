//
//  LoginView.swift
//  MobileUpSwiftApp
//
//  Created by Радэль Зубаиров on 14.08.2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @State private var isShowingLoginSheet = false
    
    var body: some View {
        if loginViewModel.isLogin {
            ContentView()
        }
        else{
            VStack{
                Spacer()
                Text("Mobile Up \nGallery")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 44, weight: .bold)).padding(.bottom, 10)
                Spacer()
                Spacer()
                Spacer()
                Button(action: {isShowingLoginSheet = true}){
                    Text("Вход через VK")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                .buttonBorderShape(.roundedRectangle(radius: 12))
                .frame(maxWidth: .infinity, alignment: .bottom)
                .controlSize(.large)
                .sheet(isPresented: $isShowingLoginSheet, content: {
                    WebView(token: $loginViewModel.token)
                })
            }
            .padding(20)
        }
                
    }
}

#Preview {
    LoginView()
}

