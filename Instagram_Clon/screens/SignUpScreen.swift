//
//  SignUpScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 23/08/21.
//

import SwiftUI

struct SignUpScreen: View {
    @EnvironmentObject var session: SessionStore
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel = SignUpViewModel()
    
    @ObservedObject var vpassw = VPASSW()
    @ObservedObject var vemail = VEMAIL()
    
    @State private var isEmailValid1 : Bool = true
    @State private var isEmailValid2 : Bool = true
    
    @State var fullname = ""    //"azamjon"
    @State var email =  ""      //"kozimov@gmail.com"
    @State var password = ""      //"123qwe"
    @State var cpassword = ""
    
    func doSignUP() {
        
        let zzz = vemail.textFieldValidatorEmail(haqida: email)
        if zzz == true {
             print("email to'g'ri")
            self.isEmailValid1 = true  }
        else {
            //email = ""
            print("email noto'g'ri")
            self.isEmailValid1 = false  }
       
        let ooo = vpassw.validpassword(mypassword: password)
        if ooo == true {
             print("Password to'g'ri")
            self.isEmailValid2 = true}
        else {
            password = ""
            cpassword = ""
            print("Password noto'g'ri")
            self.isEmailValid2 = false }
        
        
        viewModel.apiSignUp(email: email, password: password, completion: {
            result in
            if !result{
            //
            }else{
                var user = User(email: email, displayName: fullname, password: password, imgUser: "")
                user.uid = session.session?.uid
                
                presentation.wrappedValue.dismiss()
            }
        })
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utils.color1, Utils.color2]), startPoint: .bottom, endPoint: .top)
                
                VStack(spacing: 0){
                   // Spacer()
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
                    if !self.isEmailValid1 {
                       Text("email_v")
                           .font(.callout)
                           .foregroundColor(Color.red)
                   }
                    
                    TextField("password", text: $password)
                        .frame(height: 50).padding(.leading, 10)
                        .foregroundColor(.white)
                        .background(Color .white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top,10)
                    if !self.isEmailValid2 {
                       Text("password_v")
                           .font(.callout)
                           .foregroundColor(Color.red)
                   }
                   
                    TextField("cpassword", text: $cpassword)
                        .frame(height: 50).padding(.leading, 10)
                        .foregroundColor(.white)
                        .background(Color .white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top,10)
                    if !self.isEmailValid2 {
                       Text("password_v")
                        .font(.system(size: 13))
                           .foregroundColor(Color.red)
                   }
                    
                    Button(action: {
                        doSignUP()
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
                   // Spacer()
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
                    .padding()
                    
                }.padding()
                
                
                if viewModel.isLoading{
                    ProgressView()
                }
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
