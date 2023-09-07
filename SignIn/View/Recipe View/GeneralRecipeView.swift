//
//  RecipeView.swift
//  SignIn
//
//  Created by Gia Hân on 08/09/2023.
//

import SwiftUI
import FirebaseStorage

struct GeneralRecipeView: View {
    var recipe: Recipe
    var userModelView: UserViewModel
    @State private var image: UIImage = UIImage()
    @State private var username: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Image(uiImage: image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 200, height: 200)
            
            Text(recipe.name ?? "")
                .bold()
            
            Text(" by \(username)")
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .onAppear{
            retrieveRecipeImage()
            if let user = userModelView.getUserDataByDocumentID(documentID: recipe.userDocumentID){
                let firstName = user.firstName ?? ""
                let lastName = user.lastName ?? ""
                username = firstName + " " + lastName
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
    func retrieveRecipeImage() {
        // Retrieve data
        let path = recipe.image ?? ""
        let storageRef = Storage.storage().reference()
        let fileRef = storageRef.child(path)
        
        let maxSize: Int64 = Int64(5) * Int64(1024) * Int64(1024)
            
        fileRef.getData(maxSize: maxSize) { data, error in
            // Check for errors and data
            if error == nil, let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

struct GeneralRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralRecipeView(recipe: Recipe(
            name: Optional("test"),
            image: Optional("images/733FDE59-865D-4ED5-B508-FD6EF186CF5B.jpg"),
            makingTime: Optional(30),
            category: Optional("Dinner"),
            description: Optional("test"),
            ingredients: ["Chicken", "Pork"],
            instructions: ["prepare", "cook", "enjoy"],
            review: [],
            userDocumentID: "Ghngnj6XsqcNUhybGMdc",
            documentID: Optional("pKlpaclCOCElCisFuan6")), userModelView: UserViewModel())
    }
}
