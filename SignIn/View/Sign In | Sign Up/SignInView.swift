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
import Firebase

struct SignInView: View {
    @Binding var isEnglish: Bool
    @Binding var userViewModel: UserViewModel
    @State var email = ""
    @State var password = ""
    @State var loginSuccess = false
    @State private var rememberMe: Bool = false
    @State private var isShowingSignUpView = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                Spacer()
                
                Text(isEnglish ? "Sign In" : "Đăng nhập")
                    .foregroundColor(.black)
                    .font(.system(size: 40))
                    .bold()
                
                Spacer()
                
                Group {
                    TextField("Email", text: $email)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                    
                    SecureField(isEnglish ? "Password" : "Mật khẩu", text: $password)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                }
                .padding(.horizontal, 10)
                
                // Login button
                Button(action: {
                    login()
                }) {
                    Text(isEnglish ? "Sign In" : "Đăng nhập")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 50)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                }
                .background(
                    NavigationLink("", destination: AppView(email: email, userViewModel: $userViewModel, isEnglish: $isEnglish), isActive: $loginSuccess)
                )
                
                HStack{
                    Text(isEnglish ? "You don't have an account?" : "Bạn chưa có tài khoản?")
                        .foregroundColor(.black)
                    NavigationLink(destination: SignUpView(isEnglish: $isEnglish, userViewModel: $userViewModel), isActive: $isShowingSignUpView){
                        Button {
                            isShowingSignUpView = true
                        } label: {
                            Text(isEnglish ? "Sign Up" : "Đăng ký")
                                .foregroundColor(.blue)
                                .bold()
                                .underline()
                        }
                    }
                }
                
                Spacer()
            }
            .background(Image("background")
                            .resizable()
                            .scaledToFill()
                            .offset(y: -1)
                            .offset(x: 140)
                            .ignoresSafeArea()
            )
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // Login function to use Firebase to check username and password to sign in
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                loginSuccess = false
            } else {
                loginSuccess = true
            }
        }
    }
}

struct SignInViewView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(isEnglish: .constant(false), userViewModel: .constant(UserViewModel()))
    }
}
