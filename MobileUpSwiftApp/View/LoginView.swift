//
//  LoginView.swift
//  MobileUpSwiftApp
//
//  Created by Радэль Зубаиров on 14.08.2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Mobile Up \nGallery")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 44, weight: .bold)).padding(.bottom, 10)
            Spacer()
            Spacer()
            Spacer()
            Button(action: {}){
                Text("Вход через VK")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .buttonBorderShape(.roundedRectangle(radius: 12))
            .frame(maxWidth: .infinity, alignment: .bottom)
            .controlSize(.large)
        }
        .padding(20)
                
    }
}

#Preview {
    LoginView()
}
