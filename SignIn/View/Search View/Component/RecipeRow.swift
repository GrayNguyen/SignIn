/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 3
  Author: Le Tran Minh Trung
  ID: s3927071
  Created  date: 16/09/2023
  Last modified: 17/09/2023)
  Acknowledgement:
*/

import SwiftUI
import FirebaseStorage

struct RecipeRow: View {
    var recipe: Recipe
    @State private var image: UIImage = UIImage()
    
    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable().frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                .overlay(RoundedRectangle(cornerRadius: 10, style: .circular).stroke(.gray, lineWidth: 2))
            Spacer()
                .frame(width: 30)
            
                Text(recipe.name ?? "")
                .fontWeight(.medium)
            Spacer()
            
        }.onAppear() {
            retrieveImage()
        }
        .padding(.horizontal, 16)
    }
    
    func retrieveImage() {
        // Retrieve data
        let path = recipe.image ?? ""
        let storageRef = Storage.storage().reference()
        let fileRef = storageRef.child(path)
        
        let maxSize: Int64 = Int64(2) * Int64(1024) * Int64(1024)
            
        fileRef.getData(maxSize: maxSize) { data, error in
            // Check for errors and data
            if error == nil, let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image // Update the avatar on the main thread
                }
            }
        }
    }
}/*

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow()
    }
}*/
