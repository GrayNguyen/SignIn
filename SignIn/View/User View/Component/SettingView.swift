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

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isEnglish: Bool

    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 28))
                        .foregroundColor(Color("ForegroundColor"))
                        .bold()
                }

                Spacer()

                Text(isEnglish ? "Setting" : "Cài Đặt")
                    .font(.system(size: 32))

                Spacer()

                Button {
                
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 28))
                        .bold()
                        .opacity(0)
                }
            }
            .padding(.horizontal, 20)

            VStack(alignment: .leading){
               Text("LANGUAGE")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                VStack(spacing: 0){
                    Button {
                        isEnglish = true
                    } label: {
                        HStack {
                            Text(isEnglish ? "English" : "Tiếng Anh")
                                .font(.system(size: 22))
                                .foregroundColor(Color("ForegroundColor"))
                            
                            Spacer()
                            
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 28))
                                .opacity(isEnglish ? 1 : 0)
                        }
                    }
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                    
                    Button {
                        isEnglish = false
                    } label: {
                        HStack {
                            Text(isEnglish ? "Vietnamese" : "Tiếng Việt")
                                .font(.system(size: 22))
                                .foregroundColor(Color("ForegroundColor"))
                            
                            Spacer()
                            
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 28))
                                .opacity(isEnglish ? 0 : 1)
                        }
                    }
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                }
                
                Text("THEME")
                     .font(.system(size: 14))
                     .foregroundColor(.secondary)
                     .padding(.top, 20)
                
                Button {
                    
                } label: {
                    HStack {
                        Spacer()

                        VStack {
                            Image("LightMode")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .cornerRadius(16)
                            Text(isEnglish ? "Light" : "Sáng")
                                .foregroundColor(Color("ForegroundColor"))
                                .font(.title2)
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 24))
                                .foregroundColor(.blue)
                                .opacity(1)
                        }

                        Spacer()

                        VStack {
                            Image("DarkMode")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .cornerRadius(16)
                            Text(isEnglish ? "Dark" : "Tối")
                                .foregroundColor(Color("ForegroundColor"))
                                .font(.title2)
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.blue)
                                .opacity(0)
                        }

                        Spacer()
                    }
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(20)
                }
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .background(Color.gray.opacity(0.2))
        .navigationBarBackButtonHidden(true)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isEnglish: .constant(false))
    }
}
