//
//  StoreCell.swift
//  GamesDetails
//
//  Created by Aleksandra Lazarevic on 16.6.22..
//

import SwiftUI

struct StoreCell: View {
    
    @State var store: Store
    
    var body: some View {
        ZStack {
            Color.clear
            VStack {
                Image(uiImage: (store.getImageFromURL() ?? UIImage(named: "genrePlaceholder"))!).resizable().clipShape(Circle()).frame(maxWidth: 120, maxHeight: 120)
                Text(store.name).font(.title2).fontWeight(.semibold).foregroundColor(Color(hex: "#064f80"))
            }
        }.frame(width: 200, height: 200, alignment: .top)
    }
}

struct StoreCell_Previews: PreviewProvider {
    static var previews: some View {
        StoreCell(store: Store(id: 1, name: "Steam", domain: "http://www.steam.com", image: "genrePlaceholder"))
    }
}
