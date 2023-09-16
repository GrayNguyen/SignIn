//
//  SwiftUIView.swift
//  SignIn
//
//  Created by mai chieu thuy on 15/09/2023.
//

import SwiftUI

struct RecipeList: View {
    var user: User
    var recipes: [Recipe]
    var englishTitle: String
    var vietnameseTitle: String
    var userViewModel: UserViewModel
    var isEnglish: Bool
    @State private var isShowingFilter: Bool = false
    @State private var onSearchTap: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                NavigationLink(destination: SearchView(isEnglish: isEnglish, user: user, userModelView: userViewModel), isActive: $onSearchTap) {
                    SearchBarDummy(isEnglish: isEnglish, isShowingFilter: $isShowingFilter, onSearchTap: $onSearchTap)
                }
                
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
        RecipeList(user: User(
            firstName: "",
            lastName: "",
            dob: "",
            gender: "",
            email: "",
            phone: "",
            address: "",
            favourite: [],
            avatar: "",
            documentID: ""
        ), recipes: [], englishTitle: "", vietnameseTitle: "", userViewModel: UserViewModel(), isEnglish: false)
    }
}
