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

struct SignUpView: View {
    @Binding var isEnglish: Bool
    @Binding var userViewModel: UserViewModel
    @State var email = ""
    @State var password = ""
    @State var passwordConfirmation = ""
    @State var signUpSuccess = false
    @State private var isShowingSignInView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                
                Text(isEnglish ? "Sign Up" : "Đăng ký")
                    .font(.system(size: 40))
                    .bold()
                
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
                    
                    SecureField(isEnglish ? "Confirm Password" : "Nhập lại mật khẩu", text: $passwordConfirmation)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .border(Color.red, width: passwordConfirmation != password ? 1 : 0)
                        .padding(.bottom, 30)
                }
                .padding(.horizontal, 10)
                
                // Sign up button
                Button(action: {
                    signUp()
                }) {
                    Text(isEnglish ? "Sign Up" : "Đăng ký")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 50)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                }
                
                HStack{
                    Text(isEnglish ? "Already have an account?" : "Bạn đã có tài khoản?")
                    NavigationLink(destination: SignInView(isEnglish: $isEnglish, userViewModel: $userViewModel), isActive: $isShowingSignInView){
                        Button {
                            isShowingSignInView = true
                        } label: {
                            Text(isEnglish ? "Sign In" : "Đăng nhập")
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
    
    // Sign up function to use Firebase to create a new user account in Firebase
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                signUpSuccess = false
            } else {
                self.userViewModel.addNewUserData(email: email)
                signUpSuccess = true
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isEnglish: .constant(false), userViewModel: .constant(UserViewModel()))
    }
}
