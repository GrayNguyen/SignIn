//
//  SwiftUIView.swift
//  SignIn
//
//  Created by Gia Hân on 14/09/2023.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    var englishTitle: String
    var vietnameseTitle: String
    var userViewModel: UserViewModel
    var isEnglish: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                SearchBar(isEnglish: isEnglish)
                
                HStack(alignment: .top, spacing: 5){
                    VStack(alignment: .leading){
                        Text(isEnglish ? englishTitle : vietnameseTitle)
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 20)
                        
                        ForEach(0..<recipes.count, id: \.self) { index in
                            if index % 2 == 0 {
                                GeneralRecipeView(recipe: recipes[index], userViewModel: userViewModel, size: 150.0)
                            }
                        }
                    }
                    
                    VStack {
                        ForEach(0..<recipes.count, id: \.self) { index in
                            if index % 2 == 1{
                                GeneralRecipeView(recipe: recipes[index], userViewModel: userViewModel, size: 150.0)
                            }
                        }
                    }
                
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 15)
        }
        .background(Color.gray.opacity(0.2))
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList(recipes: [], englishTitle: "", vietnameseTitle: "", userViewModel: UserViewModel(), isEnglish: false)
    }
}
