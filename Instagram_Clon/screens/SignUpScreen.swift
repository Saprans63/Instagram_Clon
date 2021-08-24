//
//  SignUpScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 23/08/21.
//

import SwiftUI

struct SignUpScreen: View {
    @Environment(\.presentationMode) var presentation
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    @State var cpassword = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utils.color1, Utils.color2]), startPoint: .bottom, endPoint: .top)
                
                VStack(spacing: 0){
                    Spacer()
                    Text("app_name").foregroundColor(.white)
                        .font(Font.custom("Billabong", size: 45))
                    
                    TextField("fullname", text: $fullname)
                        .frame(height: 50).padding(.leading, 10)
                        .foregroundColor(.white)
                        .background(Color .white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top,10)
                    
                    TextField("email", text: $email)
                        .frame(height: 50).padding(.leading, 10)
                        .foregroundColor(.white)
                        .background(Color .white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top,10)
                    
                    TextField("password", text: $password)
                        .frame(height: 50).padding(.leading, 10)
                        .foregroundColor(.white)
                        .background(Color .white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top,10)
                   
                    TextField("cpassword", text: $cpassword)
                        .frame(height: 50).padding(.leading, 10)
                        .foregroundColor(.white)
                        .background(Color .white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top,10)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("sign_in")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.5)
                                .foregroundColor(.white.opacity(0.4))
                            )
                    }).padding(.top,10)
                    Spacer()
                    VStack{
                        HStack{
                            Text("allready_have_account").foregroundColor(.white)
                            Button(action: {
                                self.presentation.wrappedValue.dismiss()
                            }, label: {
                                Text("sign_in").foregroundColor(.white).fontWeight(.bold)
                            })
                            
                            
                        }
                    }.frame(maxWidth: .infinity, maxHeight: 70)
                    
                }.padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(.white)
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
