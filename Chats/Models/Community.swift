//
//  Community.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 12/10/26.
//

import Foundation

struct Community: Hashable, Equatable, Identifiable {
    let id: Int64
    
    var members: [Member]
    var channels: [Channel]
    
    let createdAt: Date
    var updatedAt: Date
}

struct Channel: Hashable, Equatable, Identifiable {
    static func == (lhs: Channel, rhs: Channel) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int64
    
    var name: String
    var type: ChannelType
    
    var messages: [Message]
}

enum ChannelType: String, Hashable, Equatable, Identifiable {
    var id: String {
        rawValue
    }
    
    case text, dm
}

struct Member: Hashable, Equatable, Identifiable {
    static func == (lhs: Member, rhs: Member) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int64
    let user: User
    
    let createdAt: Date
    let updatedAt: Date
}
