//
//  SessionStore.swift
//  Instagram_Clon
//
//  Created by Apple user on 24/08/21.
//

import Foundation
import Combine

class SessionSrore: ObservableObject{
    var didChange = PassthroughSubject<SessionSrore, Never>()
    @Published var session: User? {didSet {self.didChange.send(self) }}
    
    func listen() {
        self.session = User(uid: "asd", displayName: "asd", email: "asd")
       // self.session = nil
    }
}
