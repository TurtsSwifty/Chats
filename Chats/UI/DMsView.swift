//
//  ChatsView.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 11/10/26.
//

import SwiftUI

struct DMsView: View {
    private let cache = Cache.shared
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cache.dmChannels) { entry in
                    NavigationLink {
                        DMChatView(channel: entry)
                        // .smolBackButton()
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        LinkLabel(channel: entry)
                    }
                }
            }
            .navigationTitle("Direct Messages")
        }
    }
}

struct LinkLabel: View {
    var channel: DMChannel
    
    var body: some View {
        HStack {
            channel.user.renderedAvatar
                .font(.app(25))
                .padding(.horizontal, 4)
            
            VStack(alignment: .leading) {
                Text(channel.user.name)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
                
                Text(channel.messages.last?.content ?? "")
                    .font(.app(12))
                    .truncationMode(.tail)
                    .lineLimit(1)
            }
            .padding(.horizontal, 4)
            .multilineTextAlignment(.leading)
        }
        .padding(.all, 4)
    }
}
