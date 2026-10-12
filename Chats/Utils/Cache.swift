//
//  Cache.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 12/10/26.
//

import Foundation

class Cache {
    static var testMode = true
    
    static var shared: Cache {
        switch testMode {
        case true: return Cache.sample
        case false: return Cache()
        }
    }
    static var sample: Cache {
        let c = Cache()
        
        let user = User(id: 1, name: "defaltuser011", username: "20110201", createdAt: .now, editedAt: .now, friends: [], deleted: false)
        
        c.communities = [
            Community(id: 1, members: [], channels: [], createdAt: .now, updatedAt: .now)
        ]
        
        let cUser = User(id: 2, name: "Mineturtlee", username: "mineturtle2.", avatar: "https://cdn.discordapp.com/avatars/808606684837576714/be3ce26b8e5dad0a46ef82342a3286d2.png", createdAt: .now, editedAt: .now, friends: [user], deleted: false)
        
        c.currentUser = cUser
        
        c.dmChannels = [
            DMChannel(id: 1, user: user, messages: [
                Message(id: 1, author: user, sentDate: .now, lastUpdated: .now.advanced(by: -60.0), content: "Sample message", edits: []),
                Message(id: 2, author: cUser, sentDate: .now, lastUpdated: .now.advanced(by: -42.2), content: "Sample message 2, this is longer", edits: []),
                Message(id: 3, author: user, sentDate: .now, lastUpdated: .now, content: "Sample message 3, paragrahpe ejfaoeopjfaefojaefjojejfjoafoae", edits: [])
            ], createdAt: .distantPast)
        ]
        
        c.users = [user]
        
        return c
    }
    private init() {}
    
    var currentUser: User = User(id: -1, name: "", username: "", avatar: "", createdAt: .now, editedAt: .now, friends: [], deleted: true)
    var users: [User] = []
    var communities: [Community] = []
    var dmChannels: [DMChannel] = []
}
