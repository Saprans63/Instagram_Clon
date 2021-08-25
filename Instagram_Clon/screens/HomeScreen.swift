//
//  HomePage.swift
//  Instagram_Clon
//
//  Created by Apple user on 24/08/21.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var tabSeliction = 0
    
    var body: some View {
        
        TabView(selection: $tabSeliction) {
            HomeFeedScreen(tabSeliction: $tabSeliction)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            HomeSearchScreen()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            
            HomeUploadScreen(tabSeliction: $tabSeliction)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "camera")
                }.tag(2)
            
            HomeLikesScreen()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            
            HomeProfilesScreen()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
            
        }.accentColor(Utils.color2)
        .onAppear(){
            UITabBar.appearance().barTintColor = .white
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
