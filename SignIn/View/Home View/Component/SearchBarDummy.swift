/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 3
  Author: Le Tran Minh Trung
  ID: s3927071
  Created  date: 17/09/2023
  Last modified: 17/09/2023)
  Acknowledgement:
*/

import SwiftUI

struct SearchBarDummy: View {
    var isEnglish: Bool
    @Binding var isShowingFilter: Bool
    @Binding var onSearchTap: Bool
    @State private var text: String = ""
    
    var body: some View {
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("ForegroundColor"))
                            .font(.system(size: 18))
                            .bold()
                        
                        TextField(
                            isEnglish ? "Search any recipes" : "Tìm công thức món ăn",
                            text: $text
                        )
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("BackgroundColor"))
                        )
                        .foregroundColor(Color("ForegroundColor"))
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .simultaneousGesture(TapGesture().onEnded {
                            onSearchTap = true
                        })
                        
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


struct SearchBarDummy_Previews: PreviewProvider {
    @State static var isShowingFilter: Bool = false
    @State static var onSearchTap: Bool = false

    static var previews: some View {
        VStack{
            Spacer()
            SearchBarDummy(isEnglish: false, isShowingFilter: $isShowingFilter, onSearchTap: $onSearchTap)
            Spacer()
        }
        .background(.gray.opacity(0.3))
    }
}
