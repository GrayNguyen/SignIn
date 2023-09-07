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

struct HomeView: View {
    var user: User
    var recipes: [Recipe]
    var isEnglish: Bool
    @State private var isShowingCategories: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    //MARK: Slogan
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(isEnglish ? "Hello \(user.firstName ?? "")" : "Xin chào \(user.firstName ?? "")")
                            
                            Spacer()
                        }
                        
                        Text(isEnglish ? "What would you like \nto cook today?" : "Hôm nay bạn muốn \nnấu món gì?")
                            .font(.system(size: 32))
                            .bold()
                    }
                    .padding(.leading, 5)
                    
                    VStack(spacing: 40) {
                        //MARK: Search bar
                        SearchBar(isEnglish: isEnglish)
                        
                        VStack {
                            //MARK: Categories
                            HStack {
                                Text(isEnglish ? "Categories" : "Danh mục")
                                    .font(.system(size: 24))
                                    .bold()
                                
                                Spacer()
                                
                                Button {
                                    isShowingCategories = true
                                } label: {
                                    Text(isEnglish ? "See all" : "Xem thêm")
                                        .foregroundColor(Color("PrimaryColor"))
                                        .bold()
                                }
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(Category.categories) { category in
                                        CategoryButton(isEnglish: isEnglish, category: category, width: 100)
                                    }
                                }
                                .padding(.leading, 1)
                                .padding(.vertical, 2)
                            }
                        }
                        
                        //MARK: Recommendation
                        VStack(spacing: 10) {
                            HStack {
                                Text(isEnglish ? "Recommendation" : "Gợi ý")
                                    .font(.system(size: 24))
                                    .bold()
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Text(isEnglish ? "See all" : "Xem thêm")
                                        .foregroundColor(Color("PrimaryColor"))
                                        .bold()
                                }
                            }
                        }
                        
                        //MARK: Recipes of the week
                        VStack(spacing: 10) {
                            HStack {
                                Text(isEnglish ? "Recipes Of The Week" : "Các món ăn của tuần")
                                    .font(.system(size: 24))
                                    .bold()
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Text(isEnglish ? "See all" : "Xem thêm")
                                        .foregroundColor(Color("PrimaryColor"))
                                        .bold()
                                }
                            }
                        }
                        
                        //MARK: Recently viewed
                        VStack(spacing: 10) {
                            HStack {
                                Text(isEnglish ? "History Viewed" : "Đã xem")
                                    .font(.system(size: 24))
                                    .bold()
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Text(isEnglish ? "See all" : "Xem thêm")
                                        .foregroundColor(Color("PrimaryColor"))
                                        .bold()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 15)
                
                Spacer()
            }
            .background(Color.gray.opacity(0.2))
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(
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
        ),
        recipes: [],
        isEnglish: true)
    }
}
