/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 3
  Author: Nguyen Vi Phi Long
  ID: s3904632
  Created  date: 06/09/2023
  Last modified: 11/09/2023)
  Acknowledgement:
*/

import SwiftUI

struct AppView: View {
    var email: String
    @Binding var userViewModel: UserViewModel
    @State private var isShowingAddNewRecipe: Bool = false
    @State private var selectedTab: String = "house.fill"
    @State private var userData: User? = nil
    @State private var user: User = User(
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
    )
    @State private var recipeViewModel = RecipeViewModel()
    @State private var recipes: [Recipe] = []
    @State private var viewedRecipes: [Recipe] = []
    
    var body: some View {
        VStack {
            Group {
                switch selectedTab {
                case "house.fill":
                    HomeView(user: $user, recipes: $recipes, recipeViewModel: $recipeViewModel, userViewModel: userViewModel, viewedRecipes: $viewedRecipes)
                    
                case "heart.fill":
                    FavouriteView(user: $user, recipeViewModel: $recipeViewModel, userViewModel: userViewModel, viewedRecipes: $viewedRecipes, recipes: $recipes)
                    
                case "list.clipboard.fill":
                    MyRecipeView(recipes: $recipeViewModel.recipes, recipeViewModel: $recipeViewModel,userViewModel: userViewModel)
                    
                default:
                    UserView(user: $user, userViewModel: $userViewModel)
                }
            }
            .transition(.opacity)
            
            TabBar(isShowingAddNewRecipe: $isShowingAddNewRecipe,selectedTab: $selectedTab)
        }
        .onAppear {
            // Initialize the user based on the email when the view appears
            userData = userViewModel.getUserDataByEmail(email: email)
            if let userData = userData {
                user = userData
            }
            recipes = recipeViewModel.recipes
        }
        .sheet(isPresented: $isShowingAddNewRecipe){
            AddRecipeView(user: user, recipes: $recipes, recipeViewModel: $recipeViewModel)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(email: "", userViewModel: .constant(UserViewModel()))
    }
}
