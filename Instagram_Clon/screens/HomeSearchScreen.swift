//
//  HomeSearchScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 24/08/21.
//

import SwiftUI

struct HomeSearchScreen: View {
    @EnvironmentObject var seesion: SessionStore
    @ObservedObject var viewModel = SearchViewModel()
    @State var keyword = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    TextField("Search for user", text: $keyword)
                        .padding(.leading,15).padding(.trailing,15)
                        .frame(height: 45)
                        .font(Font.system(size: 16))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black.opacity(0.5), lineWidth: 0.5))
                        .padding(.leading, 20).padding(.trailing,20)
                        .padding(.top,20)
                    
                    List{
                        ForEach(viewModel.items, id:\.self){ item in
                            UserCell(user: item)
                                .listRowInsets(EdgeInsets())
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                if viewModel.isLoading{
                    ProgressView()
                }
            }
            .navigationBarTitle("Search", displayMode: .inline)
        }.onAppear{
            let uid = (seesion.session?.uid)!
            viewModel.apiUserList(uid: uid, keyword: keyword)
        }
    }
}

struct HomeSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchScreen()
    }
}
