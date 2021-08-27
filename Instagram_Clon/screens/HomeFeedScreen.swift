//
//  HomeFeedScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 24/08/21.
//

import SwiftUI

struct HomeFeedScreen: View {
    
    @Binding var tabSeliction: Int
    @ObservedObject var viewModel = FeedViewModel()
    
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
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.tabSeliction = 2
                                    }, label: {
                                        Image(systemName: "camera")
                                    })
            )
            .navigationBarTitle("Instagam", displayMode: .inline)
            .onAppear{
                viewModel.apiPostList {
                    print(viewModel.items.count)
                }
            }
        }
    }
}

struct HomeFeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedScreen(tabSeliction: .constant(0))
    }
}
