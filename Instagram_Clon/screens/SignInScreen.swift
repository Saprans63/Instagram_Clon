//
//  SignInScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 23/08/21.
//

import SwiftUI


struct SignInScreen: View {
    
    @State var email = ""
    @State var password = ""
    
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
                    
                    TextField("password", text: $password)
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
                            Text("dont_have_account").foregroundColor(.white)
                            NavigationLink(
                                destination: SignUpScreen(),
                                label: {
                            Text("sign_up").foregroundColor(.white).fontWeight(.bold)
                                })
                            
                            
                        }
                    }.frame(maxWidth: .infinity, maxHeight: 70)
                    
                }.padding()
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
