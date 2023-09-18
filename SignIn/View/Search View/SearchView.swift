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

struct SearchView: View {
    var isEnglish: Bool
    var user: User
    var userModelView: UserViewModel
    @StateObject var result: RecipeViewModel = RecipeViewModel()
    @State var isShowingFilter: Bool = false
    @State private var minMakingTime: Int = 0
    @State private var maxMakingTime: Int = 180
    @State private var category: String = "None"
    @State private var isShowingAll: Bool = false
    
    var body: some View {
        @State var temp = 0
        NavigationView {
            ZStack {
                VStack(spacing: 30) {
                    //MARK: Search bar
                    SearchBar(isEnglish: isEnglish, isShowingFilter: $isShowingFilter, minMakingTime: $minMakingTime, maxMakingTime: $maxMakingTime, category: $category)
                        .environmentObject(result)
                    HStack {
                        Spacer()
                        if (result.recipes.count >= 2) {
                            Text("\(result.recipes.count) results match")
                                .fontWeight(.heavy)
                        }
                        else {
                            Text("\(result.recipes.count) result matches")
                                .fontWeight(.heavy)
                        }
                        Spacer()
                        Button {
                            isShowingAll = true
                            
                        } label: {
                            Text("See all results")
                                .padding()
                                .fontWeight(.bold)
                                .background(Color.green)
                                .foregroundColor(Color.white)
                        }.clipShape(Capsule())
                            .background{
                                NavigationLink("", destination: RecipeList(user: user, recipes: result.recipes, englishTitle: "Result", vietnameseTitle: "Kết quả", userViewModel: userModelView, isEnglish: isEnglish), isActive: $isShowingAll)
                            }
                        Spacer()
                    }
                    ScrollView {
                        if (result.recipes.count <= 5) {
                            ForEach(result.recipes) { recipe in
                                VStack {
                                    RecipeRow(recipe: recipe)
                                    Divider()
                                }
                            }
                        } else {
                            ForEach(result.recipes.prefix(5)) { recipe in
                                VStack {
                                    RecipeRow(recipe: recipe)
                                    Divider()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 15)
                .sheet(isPresented: $isShowingFilter, onDismiss: {
                    temp = 1
                    print(temp)
                }, content:{
                    FilterSearchView(isEnglish: isEnglish, minTimeMaking: $minMakingTime, maxTimeMaking: $maxMakingTime, category: $category)
                })
            }.background(Color.gray.opacity(0.3))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isEnglish: true, user: User(
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
        ), userModelView: UserViewModel())
    }
}
