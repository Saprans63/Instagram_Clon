//
//  HomeLikesScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 24/08/21.
//

import SwiftUI

struct HomeLikesScreen: View {
    
    @ObservedObject var viewModel = LikeViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(viewModel.items, id:\.self){ item in
                        PostCell(post: item).listRowInsets(EdgeInsets())
                        
                    }
                }
                .listStyle(PlainListStyle())
            }
           
            
            .navigationBarTitle("Likes", displayMode: .inline)
            .onAppear{
                viewModel.apiPostList {
                    print(viewModel.items.count)
                }
            }
        }
    }
}

struct HomeLikesScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeLikesScreen()
    }
}
