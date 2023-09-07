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
    @State private var text: String = ""
    
    func search(){
        
    }
    
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
            .onSubmit {
                search()
            }
            .foregroundColor(Color("ForegroundColor"))
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
        }
        .padding(.horizontal,16)
        .background(RoundedRectangle(cornerRadius: 30).fill(Color("BackgroundColor")))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Spacer()
            SearchBar(isEnglish: false)
            Spacer()
        }
        .background(.gray.opacity(0.2))
    }
}
