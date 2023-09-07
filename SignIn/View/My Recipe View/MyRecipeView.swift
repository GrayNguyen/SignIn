//
//  MyRecipeView.swift
//  SignIn
//
//  Created by Gia Hân on 11/09/2023.
//

import SwiftUI

struct MyRecipeView: View {
    @Binding var recipes: [Recipe]
    var isEnglish: Bool
    
    var body: some View {
        VStack{
            SearchBar(isEnglish: isEnglish)
                .padding(.horizontal, 15)
            
            HStack(alignment: .top, spacing: 20){
                Spacer()
                
                VStack(alignment: .leading){
                    Text("My Recipes")
                        .font(.title2)
                        .bold()
                    
                    ForEach(0..<Category.categories.count, id: \.self) { index in
                        if index % 2 == 0 {
                        }
                    }
                }
                
                VStack {
                    ForEach(0..<Category.categories.count, id: \.self) { index in
                        if index % 2 == 1{
                        }
                    }
                }
                
                Spacer()
            }
            .background(Color.gray.opacity(0.2))
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct MyRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipeView(recipes: .constant([]), isEnglish: true)
    }
}
