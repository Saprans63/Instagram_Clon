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


    func apiUserList(uid: String, keyword: String) {
    isLoading = true
    items.removeAll()
    
    DatabaseStore().loadUsers(keyword: keyword) { users in
        self.items = users!
        self.isLoading = false
        
    }
  
}
}
