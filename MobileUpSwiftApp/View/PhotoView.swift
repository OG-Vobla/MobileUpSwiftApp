//
//  PhotoView.swift
//  MobileUpSwiftApp
//
//  Created by Радэль Зубаиров on 17.08.2024.
//

import SwiftUI

struct PhotoView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let photos: [String] = [
    "https://sun9-8.userapi.com/impg/w0LgOyKTA8q5JBkYxFdseBsYpUrqkbnlrEcyxg/gwO5jL7rETQ.jpg?size=2560x1707&quality=95&sign=91350b695fc73df9c659cb7941eb53c9&type=album",
    "https://sun9-21.userapi.com/impg/-_6R8e-iGstKJ9zCZyDho5F11yT6Rz3rB5YxFg/orzzkdDQX1k.jpg?size=1440x2160&quality=95&sign=3cb813e4d96b30a265a4a7b535647a80&type=album",
    "https://sun9-78.userapi.com/impg/9Ix_9oI5wi4w78Nx5fIXV2nmUX-YliEBhGUEXg/MiMPBPTeEfE.jpg?size=2560x1707&quality=96&sign=aef759b0ea8d488d42598cbd1625bea1&type=album",
    "https://sun9-64.userapi.com/impg/BW_Uzgfd2HmRxRecY2pbH7jLHVWw0zcAt0v-FQ/nZGhCF8zh0E.jpg?size=2560x1707&quality=96&sign=fa5738a1364a66b4a410f1f5222d6f27&type=album",
    "https://sun9-64.userapi.com/impg/BW_Uzgfd2HmRxRecY2pbH7jLHVWw0zcAt0v-FQ/nZGhCF8zh0E.jpg?size=2560x1707&quality=96&sign=fa5738a1364a66b4a410f1f5222d6f",
    ]
    
    var body: some View {
        GeometryReader { geometry in
            
        let width = geometry.size.width
        let itemWidth = (width - 10) / 2
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(photos, id: \.self) { photoUrl in
                    PhotoCellView(itemWidth: itemWidth, photoUrl: photoUrl)
                }
            }
            }
        }
    }
}

#Preview {
    PhotoView()
}
