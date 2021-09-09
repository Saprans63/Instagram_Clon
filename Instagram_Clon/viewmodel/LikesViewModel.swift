//
//  LikeViewModel.swift
//  Instagram_Clon
//
//  Created by Apple user on 27/08/21.
//

import Foundation

class LikesViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var items: [Post] = []


func apiPostList(completion: @escaping () -> () ) {
    isLoading = true
    items.removeAll()
    

    
    isLoading = false
    completion()
}
}
