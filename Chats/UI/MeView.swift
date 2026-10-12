//
//  Me.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 11/10/26.
//

import SwiftUI

struct MeView: View {
    let cache = Cache.shared
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                cache.currentUser.renderedAvatar.frame(alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .imageScale(.large)
                
                Text(cache.currentUser.name)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
            }
            .frame(minWidth: .infinity, maxWidth: .infinity, alignment: .leading)
            
            List {}
            
            Text("(c) Mineturtlee 2026 — Test Product")
                .foregroundStyle(.gray)
        }
        .padding()
    }
}
