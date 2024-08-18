//
//  MainView.swift
//  MobileUpSwiftApp
//
//  Created by Радэль Зубаиров on 17.08.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @State private var selectedTab: Tab = .photo

    enum Tab {
        case photo, video
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedTab) {
                    Text("Фото").tag(Tab.photo)
                    Text("Видео").tag(Tab.video)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Spacer()
                if selectedTab == .photo {
                    PhotoView()
                } else {
                    VideoView()
                }
                Spacer()
            }
            .navigationBarTitle("MobileUp Gallery", displayMode: .inline)
            .navigationBarItems(trailing: Button("Выход") {
                loginViewModel.logOut()
            }
            .foregroundStyle(.primary)
            )
        }
    }
}

#Preview {
    MainView()
}
