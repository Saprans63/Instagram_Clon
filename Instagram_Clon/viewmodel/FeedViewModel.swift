//
//  FeedViewModel.swift
//  Instagram_Clon
//
//  Created by Apple user on 27/08/21.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var items: [Post] = []
    
    func apiFeedList(uid: String) {
        isLoading = true
        items.removeAll()
        
        DatabaseStore().loadFeeds(uid: uid, completion: {posts in
            self.items = posts!
            self.isLoading = false
        })
    }
    
    func apiLikePost(uid: String, post: Post) {
        DatabaseStore().likeFeedPost(uid: uid, post: post)
    }
    
    func apiRemovePost(uid: String, post: Post) {
        DatabaseStore().removeMyPost(uid: uid, post: post)
        apiFeedList(uid: uid)
    }
}
