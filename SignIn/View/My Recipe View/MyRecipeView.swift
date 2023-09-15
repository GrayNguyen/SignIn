//
//  MyRecipeView.swift
//  SignIn
//
//  Created by Gia Hân on 11/09/2023.
//

import SwiftUI

struct MyRecipeView: View {
    var recipes: [Recipe]
    var userViewModel: UserViewModel
    var isEnglish: Bool
    var user: User
    
    @State private var searchText = ""
    
    var body: some View {
//        VStack{
//            SearchBar(isEnglish: isEnglish)
//                .padding(.horizontal, 15)
            
//            HStack(alignment: .top, spacing: 20){
//                Spacer()
//
//                VStack(alignment: .leading){
//                    Text("My Recipes")
//                        .font(.title2)
//                        .bold()
//
//                    ForEach(0..<Category.categories.count, id: \.self) { index in
//                        if index % 2 == 0 {
//                            UserRecipeView(recipe: recipes[index], userViewModel: userViewModel, size: 150.0)
//                        }
//                    }
//                }
//
//                VStack {
//                    ForEach(0..<Category.categories.count, id: \.self) { index in
//                        if index % 2 == 1{
//                            UserRecipeView(recipe: recipes[index], userViewModel: userViewModel, size: 150.0)
//                        }
//                    }
//                }
//
//                Spacer()
//            }
//
//
//            .background(Color.gray.opacity(0.2))
//            .navigationBarBackButtonHidden(true)
            
//        }
        
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(searchResults) {recipe in
                        NavigationLink {
                            EditRecipeView(isEnglish: isEnglish, user: user, recipeViewModel: <#T##RecipeViewModel#>, editRecipe: )
                        } label: {
                            UserRecipeView(recipe: recipe, userViewModel: userViewModel, size: 100.0)
                        }
                    }
                }
                .navigationTitle("Your Recipes")
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Recipe] {
        if searchText.isEmpty {
            return recipes
        } else {
            return recipes.filter { $0.name!.contains(searchText) }
        }
    }

}

struct MyRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipeView(recipes: [], userViewModel: UserViewModel(), isEnglish: true)
    }
}
