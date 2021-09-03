//
//  SignInScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 23/08/21.
//

import SwiftUI


struct SignInScreen: View {
    
    @ObservedObject var viewModel = SignInViewModel()
    @ObservedObject var vpassw = VPASSW()
    @ObservedObject var vemail = VEMAIL()
  
    @State private var isEmailValid1 : Bool = true
    @State private var isEmailValid2 : Bool = true
    @State var isLoading = false
    @State var email = ""         //"kozimov@gmail.com"
    @State var password = ""     //"123qwe"
    
    func doSignIn() {
        
        let zzz = vemail.textFieldValidatorEmail(haqida: email)
        if zzz == true {
             print("email to'g'ri")
            self.isEmailValid1 = true  }
        else {
            email = ""
            print("email noto'g'ri")
            self.isEmailValid1 = false  }
       
        let ooo = vpassw.validpassword(mypassword: password)
        if ooo == true {
             print("Password to'g'ri")
            self.isEmailValid2 = true}
        else {
            password = ""
            print("Password noto'g'ri")
            self.isEmailValid2 = false }
        
            viewModel.apiSignIn(email: email, password: password, completion: {
            result in
            if !result{
            //
            }   })
                            }
    
    var body: some View {
        
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utils.color1, Utils.color2]), startPoint: .bottom, endPoint: .top)
                
                VStack(spacing: 0){
                    Spacer()
                    Text("app_name").foregroundColor(.white)
                        .font(Font.custom("Billabong", size: 45))
                    
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
                    
                    
                    Button(action: {
                        doSignIn()
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
                            Text("dont_have_account").foregroundColor(.white)
                            NavigationLink(
                                destination: SignUpScreen(),
                                label: {
                            Text("sign_up").foregroundColor(.white).fontWeight(.bold)
                                })
                            
                            
                        }
                    }.frame(maxWidth: .infinity, maxHeight: 70)
                    
                }.padding()
                
                if viewModel.isLoading{
                    ProgressView()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
