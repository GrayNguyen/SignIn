//
//  MyRecipeView.swift
//  SignIn
//
//  Created by Gia Hân on 11/09/2023.
//

import SwiftUI

struct MyRecipeView: View {
    var recipeViewModel: RecipeViewModel
    var userViewModel: UserViewModel
    @State private var alertMessage: String = ""
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
//                    SearchBar()
                    
                    HStack{
                        Text("My Recipe")
                            .font(.system(size: 26))
                            .bold()
                            .padding(.bottom, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 15)
                    
                    HStack(alignment: .top, spacing: 5){
                        VStack(alignment: .leading){
                            Text("My Recipe")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.bottom, 20)
                                .opacity(0)
                            
                            ForEach(0..<recipeViewModel.recipes.count, id: \.self) { index in
                                if index % 2 == 0 {
                                    NavigationLink(destination: MyRecipeInfo(recipe: recipeViewModel.recipes[index], recipeViewModel: recipeViewModel, alertMessage: $alertMessage)) {
                                        GeneralRecipeView(recipe: recipeViewModel.recipes[index], userViewModel: userViewModel, size: 150.0)
                                    }
                                }
                            }
                        }
                        
                        VStack {
                            ForEach(0..<recipeViewModel.recipes.count, id: \.self) { index in
                                if index % 2 == 1 {
                                    NavigationLink(destination: MyRecipeInfo(recipe: recipeViewModel.recipes[index], recipeViewModel: recipeViewModel, alertMessage: $alertMessage)) {
                                        GeneralRecipeView(recipe: recipeViewModel.recipes[index], userViewModel: userViewModel, size: 150.0)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal, 15)
            }
            .background(Color.gray.opacity(0.2))
            .onChange(of: alertMessage) { newValue in
                if newValue != "" {
                    isShowingAlert = true
                }
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Delete Recipe"),
                    message: Text(alertMessage)
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MyRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipeView(recipeViewModel: RecipeViewModel(),userViewModel: UserViewModel())
    }
}
