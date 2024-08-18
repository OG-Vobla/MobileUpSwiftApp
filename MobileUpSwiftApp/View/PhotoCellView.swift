//
//  PhotoCellView.swift
//  MobileUpSwiftApp
//
//  Created by Радэль Зубаиров on 18.08.2024.
//

import SwiftUI

struct PhotoCellView: View{
    let itemWidth: CGFloat
    let photoUrl: String
    
    var body:  some View {
        AsyncImage(url: URL(string: photoUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView() // Показать индикатор загрузки
                    .frame(width: itemWidth, height: itemWidth)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill() // Заполняет квадрат, обрезая изображение по краям
                    .frame(width: itemWidth, height: itemWidth) // Устанавливаем квадратный размер
                    .clipped() // Обрезает изображение за пределами квадрата
            case .failure:
                Image(systemName: "photo") // Иконка при ошибке загрузки
                    .frame(width: itemWidth, height: itemWidth)
                    .background(Color.gray.opacity(0.3))
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    PhotoCellView(itemWidth: 100, photoUrl: "photo")
}
