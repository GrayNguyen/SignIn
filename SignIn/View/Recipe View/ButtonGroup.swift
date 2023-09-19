//
//  ButtonGroup.swift
//  SignIn
//
//  Created by Gia Hân on 17/09/2023.
//

import SwiftUI

struct ButtonGroup: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipe: Recipe
    @Binding var recipes: [Recipe]
    @Binding var recipeViewModel: RecipeViewModel
    @Binding var alertMessage: String
    @State private var isShowingAlert: Bool = false
    @State private var isEditing: Bool = false
    
    var body: some View {
        HStack(spacing: 35) {
            Button(action: {
                isEditing = true
            }, label: {
                Image(systemName: "pencil.tip")
                    .foregroundColor(Color("BackgroundColor"))
                    .font(.title2)
                    .background(Circle()
                            .fill(Color("PrimaryColor"))
                            .frame(width: 50, height: 50))
            })
            .background{
                NavigationLink("", destination: UpdateRecipeView(recipe: $recipe, recipes: $recipes, recipeViewModel: $recipeViewModel), isActive: $isEditing)
            }
            
            Button(action: {
                isShowingAlert = true
            }, label: {
                Image(systemName: "trash")
                    .foregroundColor(Color("BackgroundColor"))
                    .font(.title2)
                    .background(Circle()
                        .fill(.red)
                        .frame(width: 50, height: 50))
            })
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Are you sure you want to delete this recipe?"),
                    primaryButton: .cancel(),
                    secondaryButton: .default(
                        Text("Yes"),
                        action: {
                            recipeViewModel.deleteRecipe(recipe: recipe) { result in
                                switch result {
                                case .success(let message):
                                    alertMessage = message
                                    if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
                                        recipes.remove(at: index)
                                    }
                                case .failure(let error):
                                    alertMessage = "Error deleting recipe: \(error.localizedDescription)"
                                }
                            }
                            dismiss()
                        }
                    )
                )
            }
        }
    }
}


struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGroup(recipe: .constant(Recipe(ingredients: [], instructions: [], review: [], userDocumentID: "")), recipes: .constant([]),recipeViewModel: .constant(RecipeViewModel()), alertMessage: .constant(""))
    }
}
