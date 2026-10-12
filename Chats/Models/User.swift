//
//  User.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 12/10/26.
//

import Foundation
import SwiftUI

struct User: Identifiable, Equatable, Hashable {
    let id: Int64
    
    var name: String
    var username: String
    var avatar: String = "localhost"
    
    var renderedAvatar: some View {
        AsyncImage(url: URL(string: avatar)) { phase in
            switch phase {
            case .success(let img):
                img
                    .resizable()
                    .scaledToFill()
            default:
                Text("?")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Circle().fill(.cyan))
            }
        }
        .frame(width: 40, height: 40)
        .clipShape(Circle())
    }
    
    let createdAt: Date
    var editedAt: Date
    
    var friends: [User]
    
    var deleted: Bool
}

struct DMChannel: Identifiable, Equatable, Hashable {
    let id: Int64
    
    let user: User
    let messages: [Message]
    
    let createdAt: Date
    var updatedAt: Date {
        messages.last?.sentDate ?? .distantPast
    }
}
