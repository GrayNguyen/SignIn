//
//  FavouriteView.swift
//  SignIn
//
//  Created by Gia Hân on 08/09/2023.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                Spacer()
                
                Text("Favourite")
                
                Spacer()
            }
            
            Spacer()
        }
        .background(Color.gray.opacity(0.2))
        .navigationBarBackButtonHidden(true)
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
