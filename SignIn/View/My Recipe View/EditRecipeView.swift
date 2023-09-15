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

struct EditRecipeView: View {
    var isEnglish: Bool
    var user: User
    var recipeViewModel: RecipeViewModel
    var editRecipe: Recipe
    
    let catergoryArr: [String] = ["None", "Breakfast", "Lunch", "Dinner", "Dessert", "Smoothies"]
    
    @State private var recipeName: String = ""
    @State private var description: String = ""
    @State private var category: String = "None"
    @State private var makingTime: Int = 0
    @State private var ingredients: [String] = [""]
    @State private var instructions: [String] = [""]
    @State private var selectedImage: UIImage? = nil
    @State private var isShowingSuccess: Bool = false
    @State private var recipe: Recipe = Recipe(
        name: "",
        makingTime: 0,
        category: "None",
        description: "",
        ingredients: [],
        instructions: [],
        review: [],
        userDocumentID: "",
        documentID: ""
    )
    
    var body: some View {
        VStack{
            HStack {

                Spacer()

                Text(isEnglish ? "New Recipe" : "Món Ăn Mới")
                    .font(.system(size: 32))
                    .padding(.top, 20)

                Spacer()

            }
            .padding(.horizontal, 20)
            .padding(.bottom,20)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    VStack(alignment: .leading, spacing: 10){
                        Text("Recipe Name")
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)
                        // TextField("", text: recipe.name == nil ? recipe.name : "" )
                        
                        TextField("Recipe Name", text: $recipeName)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            .textInputAutocapitalization(.never)
                    }
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Short Description")
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)
                        
                        TextField("Short Description", text: $description)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            .textInputAutocapitalization(.never)
                    }
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Category")
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)
                        
                        SelectButton(array: catergoryArr, selection: $category)
                    }
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Making Time")
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)
                        
                        TimePicker(makingTime: $makingTime)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Ingredients")
                                .font(.system(size: 20))
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Button {
                                ingredients.append("")
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color("ForegroundColor"))
                                    .font(.system(size: 20))
                            }
                        }
                        
                        VStack(spacing: 2) {
                            ForEach(ingredients.indices, id: \.self) { index in
                                HStack {
                                    IngredientPicker(isEnglish: isEnglish, selection: $ingredients[index])
                                    
                                    Button {
                                        ingredients.remove(at: index)
                                    } label: {
                                        Text("X")
                                            .bold()
                                            .padding()
                                            .foregroundColor(.red)
                                            .background(.thinMaterial)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Intructions")
                                .font(.system(size: 20))
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Button {
                                instructions.append("")
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color("ForegroundColor"))
                                    .font(.system(size: 20))
                            }
                        }
                        
                        VStack(spacing: 2) {
                            ForEach(instructions.indices, id: \.self) { index in
                                HStack{
                                    Text("Step \(index+1)")
                                    
                                    TextField("Instruction", text: $instructions[index])
                                        .padding()
                                        .background(.thinMaterial)
                                        .cornerRadius(10)
                                        .textInputAutocapitalization(.never)
                                    
                                    Button {
                                        instructions.remove(at: index)
                                    } label: {
                                        Text("X")
                                            .bold()
                                            .padding()
                                            .foregroundColor(.red)
                                            .background(.thinMaterial)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        
                        VStack(spacing: 10){
                            HStack {
                                Text("Image")
                                    .font(.system(size: 20))
                                .foregroundColor(.secondary)
                                
                                Spacer()
                            }
                            
                            UploadImage(selectedImage: $selectedImage)
                        }
                    }
                    
                    Button {
                        handleAddButton()
                    } label: {
                        Text(isEnglish ? "Add" : "Thêm")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 300, height: 50)
                            .background(Color("PrimaryColor"))
                            .cornerRadius(10)
                            .padding(.bottom, 30)
                    }
                    .padding(.top, 25)

                }
                .padding()
            }
            
            Spacer()
        }
        .onAppear {
            recipeName = editRecipe.name!
            description = editRecipe.description!
            category = editRecipe.category!
            makingTime = editRecipe.makingTime!
            ingredients = editRecipe.ingredients.compactMap{$0}
            instructions = editRecipe.instructions.compactMap{$0}
            
        }
        .alert(isPresented: $isShowingSuccess){
            Alert(
                title: Text("Successfull"),
                message: Text("You have successfully" + "add a new recipe.")
        )}
        .background(Color.gray.opacity(0.2))
    }
    
    func handleAddButton() {
        recipeViewModel.uploadPhoto(selectedImage: selectedImage) { path in
            if let path = path {
                recipe.name = recipeName
                recipe.image = path
                recipe.description = description
                recipe.category = category
                recipe.makingTime = makingTime
                recipe.ingredients = ingredients
                recipe.instructions = instructions
                recipe.userDocumentID = user.documentID ?? ""
                
                recipeViewModel.addNewRecipe(recipe: recipe)
                
                isShowingSuccess = true
            }
        }
    }
}

struct EditRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeView(isEnglish: false, user: User(
            firstName: "",
            lastName: "",
            dob: "",
            gender: "",
            email: "",
            phone: "",
            address: "",
            favourite: [],
            avatar: "",
            documentID: "123456"
        ), recipeViewModel: RecipeViewModel(), editRecipe: Recipe(
            name: Optional("a very very and very long name"),
            image: Optional("images/733FDE59-865D-4ED5-B508-FD6EF186CF5B.jpg"),
            makingTime: Optional(30),
            category: Optional("Dinner"),
            description: Optional("test"),
            ingredients: ["Chicken", "Pork"],
            instructions: ["prepare", "cook", "enjoy"],
            review: [],
            userDocumentID: "Ghngnj6XsqcNUhybGMdc",
            documentID: Optional("pKlpaclCOCElCisFuan6")))
    }
}
