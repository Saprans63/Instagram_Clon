//
//  StarterScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 23/08/21.
//

import SwiftUI

struct StarterScreen: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack{
        if self.session.session != nil{
            HomeScreen()
        }else{
            SignInScreen()
        }
        }.onAppear{
            session.listen()
        }
        
    }
}

struct StarterScreen_Previews: PreviewProvider {
    static var previews: some View {
        StarterScreen()
    }
}
