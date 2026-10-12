//
//  Message.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 12/10/26.
//

import Foundation

struct Message: Identifiable, Hashable, Equatable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
    
    func isMine(user: User) -> Bool {
        return user.id == author.id
    }
    
    let id: Int64
    
    let author: User
    let sentDate: Date
    var lastUpdated: Date
    
    var content: String
    
    var edits: [MessageEdit]
}

struct MessageEdit: Identifiable, Hashable, Equatable {
    let id: Int64
    
    let content: String
    let parent: Message
}
