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

struct IngredientPicker: View {
    var isEnglish: Bool
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Menu {
                ForEach(Ingredient.ingredients) { ingredient in
                    Button {
                        selection = isEnglish ? ingredient.name.en : ingredient.name.vi
                    } label: {
                        HStack{
                            Text(isEnglish ? ingredient.name.en : ingredient.name.vi)
                            
                            Image(ingredient.image)
                                .resizable()
                        }
                    }
                }
            } label: {
                Label(selection, systemImage: "chevron.down")
                    .foregroundColor(Color.black.opacity(0.6))
                    .bold()
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct IngredientPicker_Previews: PreviewProvider {
    static var previews: some View {
        IngredientPicker(isEnglish: false,selection: .constant(""))
    }
}
