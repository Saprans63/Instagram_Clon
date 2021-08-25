//
//  HomeFeedScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 24/08/21.
//

import SwiftUI

struct HomeFeedScreen: View {
    
    @Binding var tabSeliction: Int
    
    var body: some View {
        NavigationView{
            ZStack{
                
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.tabSeliction = 2
                                    }, label: {
                                        Image(systemName: "camera")
                                    })
            )
            .navigationBarTitle("Instagam", displayMode: .inline)
        }
    }
}

struct HomeFeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedScreen(tabSeliction: .constant(0))
    }
}
