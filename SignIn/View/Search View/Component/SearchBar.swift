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

struct SearchBar: View {
    var isEnglish: Bool
    @Binding var isShowingFilter: Bool
    @State private var text: String = ""
    @EnvironmentObject var result: RecipeViewModel
    @Binding var minMakingTime: Int
    @Binding var maxMakingTime: Int
    @Binding var category: String
    
    var body: some View {
        let textBinding = Binding<String> (
            get: {
                text
            },
            set: {
                text = $0
                result.searchRecipe(key: text, category: category, minMakingTime: minMakingTime, maxMakingTime: maxMakingTime)
            }
        )
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("ForegroundColor"))
                .font(.system(size: 18))
                .bold()
                        
            TextField(
                isEnglish ? "Search any recipes" : "Tìm công thức món ăn",
                text: textBinding
            )
            .padding()
            .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("BackgroundColor"))
            )
            .foregroundColor(Color("ForegroundColor"))
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
                        
            Button {
                isShowingFilter = true
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(Color("ForegroundColor"))
                    .font(.system(size: 20))
                    .bold()
            }
        }
        .padding(.horizontal,16)
        .background(RoundedRectangle(cornerRadius: 30).fill(Color("BackgroundColor")))
    }
}


struct SearchBar_Previews: PreviewProvider {
    @State static var isShowingFilter: Bool = false
    @State static var onSearchTap: Bool = false
    @State static var minMakingTime: Int = 0
    @State static var maxMakingTime: Int = 0
    @State static var category: String = "None"
    @StateObject static var result: RecipeViewModel = RecipeViewModel()

    static var previews: some View {
        VStack{
            Spacer()
            SearchBar(isEnglish: false, isShowingFilter: $isShowingFilter, minMakingTime: $minMakingTime, maxMakingTime: $maxMakingTime, category: $category)
                .environmentObject(result)
            Spacer()
        }
        .background(.gray.opacity(0.3))
    }
}
