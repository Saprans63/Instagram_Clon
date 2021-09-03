//
//  ProfileViewModel.swift
//  Instagram_Clon
//
//  Created by Apple user on 28/08/21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var items: [Post] = []


func apiPostList(completion: @escaping () -> () ) {
    isLoading = true
    items.removeAll()
    
    self.items.append(Post(title: "Azamjon", content: "Avgust 8, 2021", imgUrl: Utils.image1))
    self.items.append(Post(title: "Azamjon", content: "Avgust 8, 2021", imgUrl: Utils.image2))
    self.items.append(Post(title: "Azamjon", content: "Avgust 8, 2021", imgUrl: Utils.image1))
    self.items.append(Post(title: "Azamjon", content: "Avgust 8, 2021", imgUrl: Utils.image2))
    self.items.append(Post(title: "Azamjon", content: "Avgust 8, 2021", imgUrl: Utils.image1))
    self.items.append(Post(title: "Azamjon", content: "Avgust 8, 2021", imgUrl: Utils.image2))
    
    isLoading = false
    completion()
}
    
    func apiSignOut() {
        SessionStore().signOut()
    }
    
}
