//
//  SearchViewModel.swift
//  Instagram_Clon
//
//  Created by Apple user on 28/08/21.
//

import Foundation


class SearchViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var items: [User] = []


func apiUserList(completion: @escaping () -> () ) {
    isLoading = true
    items.removeAll()
    
    self.items.append(User(uid: "1", displayName: "Azamjon", email: "KozimovAzamjon"))
    self.items.append(User(uid: "2", displayName: "Azamjon", email: "KozimovAzamjon"))
    self.items.append(User(uid: "1", displayName: "Azamjon", email: "KozimovAzamjon"))
    self.items.append(User(uid: "2", displayName: "Azamjon", email: "KozimovAzamjon"))
    self.items.append(User(uid: "1", displayName: "Azamjon", email: "KozimovAzamjon"))
    self.items.append(User(uid: "2", displayName: "Azamjon", email: "KozimovAzamjon"))

    
    isLoading = false
    completion()
}
}
